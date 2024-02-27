import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/LAWYER/HOME/MESSAGE/V/message.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/M/model.dart';
import 'package:inkozi/widgets/widget.dart';

class LawyerCHat extends StatefulWidget {
  const LawyerCHat({super.key});
  static const String routeName = '/lawyerchat';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LawyerCHat(),
    );
  }

  @override
  State<LawyerCHat> createState() => _LawyerCHatState();
}

class _LawyerCHatState extends State<LawyerCHat> {
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

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: CustomAppBar(
            leading: SizedBox(),
          ),
          endDrawer: DrawerWidget(),
          body: GetBuilder<LawyerChatCOntroller>(initState: (state) {
            Get.put(LawyerChatCOntroller());
          }, builder: (obj) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
              child: obj
                      .questionReceivedREQModelLawyer!.advisorQuestions!.isEmpty
                  ? Center(
                      child: Text(
                      "No Questions Asked By Users",
                      textAlign: TextAlign.center,
                    ))
                  : ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: obj.questionReceivedREQModelLawyer!
                          .advisorQuestions!.length,
                      itemBuilder: (context, index) {
                        AdvisorQuestions model = obj
                            .questionReceivedREQModelLawyer!
                            .advisorQuestions![index];
                        String username =
                            "${model.userFirstname ?? ''} ${model.userLastname ?? ''}";
                        return model.advisorId == '0'
                            ? SizedBox()
                            : GestureDetector(
                                onTap: () {
                                  if (model.accepted == '1') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MessageLawyerScreen(
                                                  receiverID: model.userId!,
                                                  title: username,
                                                  questionID:
                                                      model.questionId!),
                                        ));
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
                                            if (model.accepted == '0') {
                                              obj.chatacceptAPI(
                                                  question_id: int.parse(
                                                      model.questionId!),
                                                  context: context);
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        MessageLawyerScreen(
                                                            receiverID:
                                                                model.userId!,
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
                                                  ? "Accept"
                                                  : "Chat",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.027,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            padding: EdgeInsets.zero,
                                            backgroundColor:
                                                model.accepted == '0'
                                                    ? Colors.green
                                                    : primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                      },
                    ),
            );
          }),
        ),
      ),
    );
  }
}
