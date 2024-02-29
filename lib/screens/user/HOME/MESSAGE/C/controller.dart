import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/api_serivices/api_serivices.dart';
import 'package:inkozi/screens/LAWYER/HOME/MESSAGE/M/model.dart';
import 'package:intl/intl.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class MessageChatController extends GetxController {
  static MessageChatController get to => Get.find();
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
      messageList = [];
      List<ChatLog> newchatLog = model.chatLog!.where((element) {
        return element.sender == StaticValues.userInfo!.userId &&
                element.reciver == receiverID ||
            element.sender == receiverID &&
                element.reciver == StaticValues.userInfo!.userId;
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
      'sender_id': reciver,
      'user_id': StaticValues.userInfo!.userId,
      'message': message
    };

    var response = await httpClient().post(url, data: map);
    if (response.statusCode == 200) {}
  }

  void addmessagetodummielist({
    required String reciver,
    required String questionId,
    required IO.Socket? socket,
  }) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
    String sendingtext = messageController.text;

    socket!.emit('live_notify', {
      'message': sendingtext,
      'user_id': StaticValues.userInfo!.userId,
      'question_id': questionId,
      'sender_id': reciver,
      'time_chat': formattedDate,
    });

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
