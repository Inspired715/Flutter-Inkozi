import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:inkozi/widgets/custom_snackbar.dart';

class RegistrationController extends GetxController {
  static RegistrationController get to => Get.find();
  bool loading = false;
  //
  TextEditingController usernameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  void registerUser(verifiedPhone, context) async {
    print("verifiedPhone ${verifiedPhone}");
    loading = true;
    update();
    final String apiUrl = 'https://www.inkozi.com/api/01/user_registration';
    final Map<String, String> registrationData = {
      'username': usernameController.text,
      'first_name': firstNameController.text,
      'last_name': lastNameController.text,
      'email': emailController.text,
      'password': passwordController.text,
      'phone': verifiedPhone, // Use the verified phone number
    };
    final Map<String, String> headers = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
    };

    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: registrationData,
    );
    print('Loaded response: $response');
    if (response.statusCode == 200) {
      showCustomSnackBar("User register Success", isError: false);
      loading = false;
      update();
      Navigator.pushNamed(context, '/registrationComplete');
    } else {
      loading = false;
      update();
      showCustomSnackBar("Registration failed. Please try again.",
          isError: true);
    }
  }
}
