import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/api_serivices/api_serivices.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/M/model.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/V/lawyer_chat.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';

class LawyerChatCOntroller extends GetxController {
  static LawyerChatCOntroller get to => Get.find();

// Questions Received (API) FOR LAWYERS
  QuestionAdvisorModel? questionReceivedREQModelLawyer;
  void getQuestionsReceiveReqUser(
      String advisorID, context, bool navigate) async {
    String url =
        'https://www.inkozi.com/api/01/question_law?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&advisor_id=${advisorID}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      questionReceivedREQModelLawyer =
          await QuestionAdvisorModel.fromJson(data);
      navigate
          ? Future.delayed(Duration(seconds: 7), () async {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LawyerCHat()),
                  (Route<dynamic> route) => false);
            })
          : null;
    }
  }

  void chatacceptAPI({
    required int question_id,
    required BuildContext context,
  }) async {
    String url = 'https://www.inkozi.com/api/01/chat_accept';
    var map = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100',
      'advisor_id': StaticValues.lawyerInfo!.advisorId!,
      'question_id': question_id,
    };

    var response = await httpClient().post(url, data: map);
    log("response.statusCode  ${response.statusCode}");
    if (response.statusCode == 200) {
      log("response.data  ${response.data}");
      getQuestionsReceiveReqUser(
          StaticValues.lawyerInfo!.advisorId!, context, false);
      update();
      showCustomSnackBar(response.toString(), isError: false);
    }
  }
}
