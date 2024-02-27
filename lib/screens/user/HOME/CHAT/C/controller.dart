import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/USER/HOME/LAWERSEARCH/M/question_req_model.dart';

class UserChatCOntroller extends GetxController {
  static UserChatCOntroller get to => Get.find();

  QuestionREQModel? questionSendREQModelUser;
  // List<String> questions = [];
  void getQuestionsSendReqUser({required BuildContext context}) async {
    String url =
        'https://www.inkozi.com/api/01/question_user?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&user_id=${StaticValues.userInfo!.userId}';
    // 'https://www.inkozi.com/api/01/question_user?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&user_id=50';
    var response = await http.get(Uri.parse(url));
    log("response.statusCode ${response.statusCode}");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      questionSendREQModelUser = await QuestionREQModel.fromJson(data);
      // questions.clear();
      // for (var u in questionSendREQModelUser!.userSendQuestionRequest!) {
      //   questions.add(u.questionId!);
      // }
    }
  }
}
