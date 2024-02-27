import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';

class EditProfileLAwyerController extends GetxController {
  static EditProfileLAwyerController get to => Get.find();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordCOntroller = TextEditingController();
  // Future<void> updateProfile(
  //   context,
  // ) async {
  //   final apiUrl = StaticValues.baseURL + StaticValues.editprofile;

  //   var logindata = {
  //     'first_name': firstNameController.text,
  //     'user_id': StaticValues.lawyerInfo!.advisorId,
  //     'last_name': lastNameController.text,
  //     'password': passwordCOntroller.text,
  //   };
  //   final Map<String, String> headers = {
  //     'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
  //   };
  //   http.Response response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: headers,
  //     body: logindata,
  //   );
  //   log('Loaded response: $response');

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);

  //     showCustomSnackBar("User Profile update successfully.", isError: false);
  //     getProfile(context);
  //   } else {
  //     showCustomSnackBar("error", isError: true);
  //   }
  // }

  Future<void> getProfile(
    context,
  ) async {
    final apiUrl =
        "https://inkozi.com/api/01/fetch_service_provider?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&phone=${StaticValues.lawyerInfo!.phone}";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      UserModel model = UserModel.fromJson(responseData);
      StaticValues.userInfo = model.userInfo!;
    } else {
      showCustomSnackBar("error", isError: true);
    }
  }
}
