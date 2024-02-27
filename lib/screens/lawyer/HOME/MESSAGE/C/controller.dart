import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import 'package:inkozi/api_serivices/api_serivices.dart';
import 'package:inkozi/screens/LAWYER/HOME/MESSAGE/M/model.dart';
import 'package:intl/intl.dart';
import 'package:inkozi/constrains/app_constrains.dart';

class MessageLawyerController extends GetxController {
  static MessageLawyerController get to => Get.find();
  TextEditingController messageController = TextEditingController();
  List<ChatLog>? messageList;
  Future<List<ChatLog>?> getChat(
      String question_id, context, String receiverID) async {
    messageList = null;
    String url =
        'https://www.inkozi.com/api/01/chat_data_log?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&question_id=${question_id}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      MessageModel model = MessageModel.fromJson(data);

      List<ChatLog> newchatLog = model.chatLog!.where((element) {
        return element.sender == StaticValues.lawyerInfo!.advisorId &&
                element.reciver == receiverID ||
            element.sender == receiverID &&
                element.reciver == StaticValues.lawyerInfo!.advisorId;
      }).toList();

      messageList = newchatLog;
      update();
      return newchatLog;
    } else {
      return null;
    }
  }

  void sendChat({
    required int question_id,
    required int reciver,
    required String message,
  }) async {
    String url = 'https://www.inkozi.com/api/01/chat_send';
    var map = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100',
      'question_id': question_id,
      'sender': StaticValues.lawyerInfo!.advisorId,
      'reciver': reciver,
      'message': message
    };
    var response = await httpClient().post(url, data: map);
    if (response.statusCode == 200) {}
  }

  void addmessagetodummielist({
    required String reciver,
    required String questionId,
  }) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    messageList!.add(
      ChatLog(
        message: messageController.text,
        questionId: questionId,
        reciver: reciver,
        sender: StaticValues.lawyerInfo!.advisorId,
        timeChat: formattedDate,
      ),
    );
    String sendingtext = messageController.text;
    messageController.clear();
    update();
    // send
    sendChat(
      question_id: int.parse(questionId),
      reciver: int.parse(reciver),
      message: sendingtext,
    );
  }
}
