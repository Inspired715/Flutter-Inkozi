import 'dart:convert';
import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/LAWYER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/V/lawyer_chat.dart';
import 'package:inkozi/screens/lawyer/auth/OTP/OTP.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControllerLawyer extends GetxController {
  static LoginControllerLawyer get to => Get.find();
  // final FirebaseAuth auth = FirebaseAuth.instance;
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

    final apiUrl = 'https://www.inkozi.com/api/01/lawyer_phone_twilio_login';

    final Map<String, String> logindata = {
      'phone': phone.toString(),
    };
    final Map<String, String> headers = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
    };
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: logindata,
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == 0) {
        loading = false;
        update();
        showCustomSnackBar(responseData['msg'], isError: true);
        Navigator.pushNamed(context, '/registerlawyer');
      } else if (responseData['status'] == 1) {
        LawyerModel model = LawyerModel.fromJson(responseData);
        StaticValues.tokan = model.lawyerInfo!.token;
        StaticValues.phone = phone;
        StaticValues.lawyerInfo = model.lawyerInfo!;
        print("lawyer id is ${model.lawyerInfo!.advisorId!}");
        StaticValues.isuser = false;
        if (navigate) {
          showCustomSnackBar(model.msg!, isError: false);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPVerifyLawyer(
                phone: phone,
              ),
            ),
          );
          LawyerChatCOntroller.to.getQuestionsReceiveReqUser(
            StaticValues.lawyerInfo!.advisorId!,
            context,
            false,
          );
        }
        loading = false;
        update();
      }
    } else {
      loading = false;
      update();
      showCustomSnackBar("else", isError: true);
      Navigator.pushNamed(context, '/registerlawyer');
    }
    // }
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
    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData['status'] == '1') {
        if (StaticValues.logginedChecker) {
          savelawyersession(StaticValues.tokan!, StaticValues.phone!);
        }
        loading = false;
        update();
        showCustomSnackBar(responseData['msg'], isError: false);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LawyerCHat()),
            (Route<dynamic> route) => false);
      } else {
        loading = false;
        update();
        showCustomSnackBar("OTP Code is Wrong", isError: true);
      }
    }
  }

  // void sendcode(
  //     {required String completephone,
  //     required String phone,
  //     required var context}) async {
  //   try {
  //     await FirebaseAuth.instance.verifyPhoneNumber(
  //       phoneNumber: completephone,
  //       verificationCompleted: (PhoneAuthCredential credential) {},
  //       verificationFailed: (FirebaseAuthException e) {},
  //       codeSent: (String verificationId, int? resendToken) {

  Future savelawyersession(String tokan, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("tokan", tokan);
    prefs.setBool("isuser", false);
    prefs.setString("phone", phone);
  }
}
