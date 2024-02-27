import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/screens/USER/HOME/LAWERSEARCH/M/question_req_model.dart';
import 'package:inkozi/screens/USER/HOME/MESSAGE/V/message.dart';
import 'package:inkozi/widgets/CustomAppBar.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';

class UserAllChats extends StatefulWidget {
  const UserAllChats({super.key});
  static const String routeName = '/userAllChat';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => UserAllChats(),
    );
  }

  @override
  State<UserAllChats> createState() => _UserAllChatsState();
}

class _UserAllChatsState extends State<UserAllChats> {
  ScrollController _scrollController = ScrollController();
  List<String> users = [
    'Alexander Clam',
    'John Doe',
    'Adam',
    'Tony',
    'Chris',
    'Gayl',
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    DateTime now = DateTime.now();
    DateTime yesterday = DateTime(now.year, now.month, now.day - 1);

    // messages.sort((a, b) => b.dateTime.compareTo(a.dateTime));

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: GetBuilder<UserChatCOntroller>(builder: (obj) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
            child: obj
                    .questionSendREQModelUser!.userSendQuestionRequest!.isEmpty
                ? Center(child: Text("No Questions Sent"))
                : ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: obj.questionSendREQModelUser!
                        .userSendQuestionRequest!.length,
                    itemBuilder: (context, index) {
                      UserSendQuestionRequest model = obj
                          .questionSendREQModelUser!
                          .userSendQuestionRequest![index];
                      String username =
                          "${model.firstName ?? ''} ${model.lastName ?? ''}";
                      return model.advisorId == '0'
                          ? SizedBox()
                          : GestureDetector(
                              onTap: () {
                                if (model.accepted == '1') {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MessageUserScreen(
                                            receiverID: model.advisorId!,
                                            title: username,
                                            questionID: model.questionId!),
                                      ));
                                } else {
                                  showCustomSnackBar("not accepted",
                                      isError: true);
                                }
                              },
                              child: Container(
                                width: ScreenUtil().screenWidth,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w, vertical: 5.h),
                                margin: EdgeInsets.symmetric(vertical: 4.h),
                                decoration: BoxDecoration(
                                    color: headerFillColor,
                                    border: Border.all(color: primaryColor),
                                    borderRadius: BorderRadius.circular(40)),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 22.r,
                                      backgroundImage: AssetImage(
                                          'assets/icons/chat_profile.png'),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          username,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Container(
                                          width: width * 0.5,
                                          // color: Colors.amber,
                                          child: Text(
                                            model.question!,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            maxLines: 2,
                                            style: TextStyle(
                                              color: inputTextColor,
                                              fontSize: 13.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: height * 0.035,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (model.accepted == '1') {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      MessageUserScreen(
                                                          receiverID:
                                                              model.advisorId!,
                                                          title: username,
                                                          questionID: model
                                                              .questionId!),
                                                ));
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: width * 0.03,
                                          ),
                                          child: Text(
                                            model.accepted == '0'
                                                ? "Waiting"
                                                : "Chat",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: width * 0.027,
                                            ),
                                          ),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          padding: EdgeInsets.zero,
                                          backgroundColor: model.accepted == '0'
                                              ? Colors.red
                                              : primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                        ),
                                      ),
                                    )
                                    //  Padding(
                                    //     padding: EdgeInsets.only(
                                    //       top: 13.h,
                                    //       right: 3.w,
                                    //     ),
                                    //     child: Column(
                                    //       crossAxisAlignment:
                                    //           CrossAxisAlignment.end,
                                    //       children: [
                                    //         Text(
                                    //           'time',
                                    //           // messages[index].dateTime.day ==
                                    //           //         DateTime.now().day
                                    //           //     ? DateFormat.jm()
                                    //           //         .format(messages[index].dateTime)
                                    //           //     : messages[index].dateTime.year ==
                                    //           //                 yesterday.year &&
                                    //           //             messages[index]
                                    //           //                     .dateTime
                                    //           //                     .month ==
                                    //           //                 yesterday.month &&
                                    //           //             messages[index].dateTime.day ==
                                    //           //                 yesterday.day
                                    //           //         ? 'Yesterday'
                                    //           //         : DateFormat('dd/MM/yy').format(
                                    //           //             messages[index].dateTime),
                                    //           style: TextStyle(
                                    //             color: textLightBlueGrey,
                                    //             fontSize: 10.sp,
                                    //             fontWeight: FontWeight.w500,
                                    //           ),
                                    //         ),
                                    //         SizedBox(
                                    //           height: 3.h,
                                    //         ),
                                    //         Padding(
                                    //           padding: EdgeInsets.only(right: 3.w),
                                    //           child: CircleAvatar(
                                    //             maxRadius: 10.r,
                                    //             backgroundColor: primaryColor,
                                    //             child: Center(
                                    //               child: Text(
                                    //                 '3',
                                    //                 style: TextStyle(
                                    //                     color: bgColor,
                                    //                     fontSize: 12.sp,
                                    //                     fontWeight:
                                    //                         FontWeight.w600),
                                    //               ),
                                    //             ),
                                    //           ),
                                    //         )
                                    //       ],
                                    //     ),
                                    //   )
                                  ],
                                ),
                              ),
                            );
                    },
                  ),
          );
        }),
      ),
    );
  }
}
