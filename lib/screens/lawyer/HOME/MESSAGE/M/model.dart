class MessageModel {
  List<ChatLog>? chatLog;
  String? status;
  String? error;

  MessageModel({this.chatLog, this.status, this.error});

  MessageModel.fromJson(Map<String, dynamic> json) {
    if (json['chat_log'] != null) {
      chatLog = <ChatLog>[];
      json['chat_log'].forEach((v) {
        chatLog!.add(new ChatLog.fromJson(v));
      });
    }
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chatLog != null) {
      data['chat_log'] = this.chatLog!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

class ChatLog {
  String? sender;
  String? reciver;
  String? timeChat;
  String? message;
  String? questionId;

  ChatLog(
      {this.sender,
      this.reciver,
      this.timeChat,
      this.message,
      this.questionId});

  ChatLog.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    reciver = json['reciver'];
    timeChat = json['time_chat'];
    message = json['message'];
    questionId = json['question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['reciver'] = this.reciver;
    data['time_chat'] = this.timeChat;
    data['message'] = this.message;
    data['question_id'] = this.questionId;
    return data;
  }
}
