import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/V/login.dart';
import 'package:inkozi/screens/screens.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControllerUser extends GetxController {
  static LoginControllerUser get to => Get.find();

  bool loading = false;

  Future<void> performLogin({
    required var context,
    required String verifiedPhone,
    required String completephone,
    required bool navigate,
  }) async {
    loading = true;
    update();
    final phone = verifiedPhone.replaceAll(RegExp(r'\D+'), '');
    log("phone ${phone}");
    // final phone = "4078006401";
    if (phone.isNotEmpty) {
      final apiUrl = 'https://www.inkozi.com/api/01/user_phone_twilio_login';

      final Map<String, String> logindata = {
        'phone': phone,
      };
      final Map<String, String> headers = {
        'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
      };
      http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: logindata,
      );
      print("response.statusCode ${response.statusCode}");
      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        print("response ${responseData['status']}");
        if (responseData['status'] == 1) {
          UserModel model = UserModel.fromJson(responseData);
          // no tokan its user id
          StaticValues.tokan = model.userInfo!.userId!;
          StaticValues.phone = phone;
          StaticValues.userInfo = model.userInfo;
          StaticValues.isuser = true;
          LogInPage.verifiedPhone = phone;
          LogInPage.completePhone = completephone;
          loading = false;
          update();
          if (navigate) {
            showCustomSnackBar(responseData['msg'], isError: false);
            Navigator.pushNamed(context, '/otplogin');
          }
        } else if (responseData['status'] == 0) {
          loading = false;
          update();
          showCustomSnackBar(responseData['msg'], isError: true);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    UserRegistrationPage(verifiedPhone: phone),
              ));
        }
      } else {
        loading = false;
        update();
        showCustomSnackBar("Login failed. Please try again.", isError: true);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UserRegistrationPage(verifiedPhone: verifiedPhone),
            ));
      }
    }
  }

  void verifyOTP(
      {required String phone,
      required String code,
      required var context}) async {
    loading = true;
    update();

    final apiUrl = 'https://www.inkozi.com/api/01/otp_confirmation';

    final Map<String, String> otpdata = {
      'phone': phone.toString(),
      'otp': code.toString(),
    };
    final Map<String, String> headers = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
    };
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: otpdata,
    );
    print("response is ${response.statusCode}");
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == '1') {
        if (StaticValues.logginedChecker) {
          saveUserSession(StaticValues.tokan!, StaticValues.phone!);
        }

        loading = false;
        update();
        showCustomSnackBar(responseData['msg'], isError: false);
        Get.offAll(LawyerBySpecialSearch());
      } else {
        loading = false;
        update();
        showCustomSnackBar("OTP Code is Wrong", isError: true);
      }
    }
  }

  Future saveUserSession(String tokan, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tokan", tokan);
    prefs.setBool("isuser", true);
    prefs.setString("phone", phone);
  }
}
