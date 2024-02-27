import 'dart:developer';
import 'package:get/get.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/LAWYER/HOME/MESSAGE/M/model.dart';
import 'package:inkozi/screens/USER/HOME/MESSAGE/C/controller.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/widgets/CustomAppBar.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class MessageUserScreen extends StatefulWidget {
  const MessageUserScreen({
    super.key,
    required this.title,
    required this.receiverID,
    required this.questionID,
  });
  final String title;
  final String questionID;
  final String receiverID;

  @override
  State<MessageUserScreen> createState() => _MessageUserScreenState();
}

class _MessageUserScreenState extends State<MessageUserScreen> {
  io.Socket? socket;
  ScrollController _scrollController = ScrollController();
  void connect() {
    socket = io.io("https://www.inkozi.com:3000", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket!.connect();
    log("socket connection ${socket!.connected}");
    socket!.onConnect((data) {
      log("Connected");
      socket!.on('live_notify', (msg) {
        log(msg);

        ChatLog model = ChatLog(
          questionId: data['question_id'],
          reciver: data['advisor_id'],
          sender: data['sender_id'],
          timeChat: data['time_chat'],
          message: data['message'],
        );

        MessageChatController.to.messageList!.add(model);
        _scrollController.animateTo(_scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 300), curve: Curves.easeOut);
        setState(() {});
      });
    });
  }

  // void connect() {
  //   socket = IO.io(
  //       'https://www.inkozi.com:3000',
  //       IO.OptionBuilder()
  //           .setTransports(['websocket']) // for Flutter or Dart VM
  //           .disableAutoConnect() // disable auto-connection
  //           .setExtraHeaders({'foo': 'bar'}) // optional
  //           .build());
  //   socket!.connect();
  //   socket!.onConnect((data) {
  //     socket!.on('live_notify', (data) {
  //       print(data);
  //     });
  //   });

  //   print("Flutter connect ${socket!.connected}");
  // }

  @override
  void initState() {
    connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    connect();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          action: Container(),
          title: Padding(
            padding: EdgeInsets.only(left: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 22,
                  backgroundImage: AssetImage('assets/icons/chat_profile.png'),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.title,
                      style: CustomTextStyle.bc18med,
                    ),
                    Text(
                      'Online',
                      style: CustomTextStyle.bc14med,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        body: GetBuilder<MessageChatController>(initState: (state) {
          Get.put(MessageChatController());
          MessageChatController.to.messageController.clear();
          MessageChatController.to
              .getChat(widget.questionID, context, widget.receiverID);
        }, builder: (obj) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/icons/chat_bg.png',
                height: 240.h,
              ),
              Column(children: [
                Expanded(
                  child: obj.messageList == null
                      ? Center(
                          child: CircularProgressIndicator(
                          color: primaryColor,
                        ))
                      : obj.messageList!.isEmpty
                          ? Center(
                              child: Text(
                                'No Chat',
                                style: CustomTextStyle.ts13normalblack,
                              ),
                            )
                          : GroupedListView<ChatLog, DateTime>(
                              controller: _scrollController,
                              shrinkWrap: true,
                              reverse: true,
                              order: GroupedListOrder.DESC,
                              floatingHeader: true,
                              padding: EdgeInsets.all(15),
                              elements: obj.messageList!,
                              groupBy: (message) {
                                DateTime dateTime =
                                    DateTime.parse(message.timeChat!);
                                DateTime dayDatetime = DateTime(dateTime.year,
                                    dateTime.month, dateTime.day);
                                return dayDatetime;
                              },
                              groupHeaderBuilder: (ChatLog message) => Center(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 3.h),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: primaryColor,
                                  ),
                                  child: Text(
                                    DateTime.parse(message.timeChat!).day ==
                                            DateTime.now().day
                                        ? 'Today'
                                        : DateFormat.yMMMd().format(
                                            DateTime.parse(message.timeChat!)),
                                    style: CustomTextStyle.bc14med,
                                  ),
                                ),
                              ),
                              itemBuilder: (context, ChatLog message) => Align(
                                alignment: message.sender ==
                                        StaticValues.userInfo!.userId
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      message.sender ==
                                              StaticValues.userInfo!.userId
                                          ? 30.w
                                          : 20.w,
                                      20.h,
                                      40.w,
                                      20.w),
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: primaryColor, width: 1.w),
                                    color: Color(0xffF3E5F4),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30.r),
                                        topRight: Radius.circular(30.r),
                                        bottomRight: Radius.circular(message
                                                    .sender ==
                                                StaticValues.userInfo!.userId
                                            ? 0
                                            : 30.r),
                                        bottomLeft: Radius.circular(message
                                                    .sender ==
                                                StaticValues.userInfo!.userId
                                            ? 30.r
                                            : 0)),
                                  ),
                                  child: Text(
                                    message.message!,
                                    textAlign: TextAlign.justify,
                                    style: CustomTextStyle.pc16bold,
                                  ),
                                ),
                              ),
                            ),
                ),
                Container(
                  width: ScreenUtil().screenWidth,
                  padding: EdgeInsets.fromLTRB(30.w, 0, 15.w, 10.h),
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Color(0xffF3E5F4),
                    borderRadius: BorderRadius.circular(32.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          minLines: 1,
                          controller: obj.messageController,
                          onFieldSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeOut);
                              obj.addmessagetodummielist(
                                socket: socket!,
                                questionId: widget.questionID,
                                reciver: widget.receiverID,
                              );
                            }
                          },
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                          cursorColor: primaryColor,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 5),
                            //   border: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //       color: primaryColor,
                            //       width: 1.w,
                            //     ),
                            //   ),
                            //   enabledBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //       color: primaryColor,
                            //       width: 1.w,
                            //     ),
                            //   ),
                            //   focusedBorder: UnderlineInputBorder(
                            //     borderSide: BorderSide(
                            //       color: primaryColor,
                            //       width: 1.w,
                            //     ),
                            //   ),
                            hintText: 'Type your message here',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff857B7B),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 30.w,
                      //   padding: EdgeInsets.only(top: 5.h),
                      //   decoration: BoxDecoration(),
                      //   child: Center(
                      //     child: Image.asset(
                      //       'assets/icons/emoji.png',
                      //       height: 18.h,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: EdgeInsets.only(top: 5.h),
                        child: Row(
                          children: [
                            // SizedBox(
                            //   width: 5.w,
                            // ),
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     height: 30.h,
                            //     width: 40.w,
                            //     color: Colors.transparent,
                            //     child: Center(
                            //       child: Image.asset(
                            //         'assets/icons/link.png',
                            //         height: 18.h,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            GestureDetector(
                              onTap: () {
                                if (obj.messageController.text.isNotEmpty) {
                                  obj.addmessagetodummielist(
                                    socket: socket!,
                                    questionId: widget.questionID,
                                    reciver: widget.receiverID,
                                  );
                                }
                              },
                              child: Container(
                                height: 30.h,
                                width: 40.w,
                                color: Colors.transparent,
                                child: Center(
                                  child: Image.asset(
                                    'assets/icons/send.png',
                                    height: 18.h,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ],
          );
        }),
      ),
    );
  }
}
