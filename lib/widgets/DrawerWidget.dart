import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/screens/LAWYER/AUTH/LOGIN/V/LogInLawyer.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/V/login.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/V/all_chat%20_users.dart';
import 'package:inkozi/screens/USER/HOME/EDITPROFILE/V/edit_profile.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/C/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: StaticValues.isuser!
            ? ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).closeEndDrawer();
                        },
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/arrow_back.png',
                              height: 15.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 435.h,
                    width: 100.w,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: primaryColor, width: 2.w),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Column(
                      children: [
                        DrawerButtons(
                          onTap: () {
                            Navigator.pushNamed(context, '/myprofile');
                          },
                          icon: 'profile',
                          text: 'My Profile',
                        ),
                        DrawerButtons(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfile(),
                                ));
                          },
                          icon: 'change_password',
                          text: 'Change Password',
                        ),

                        DrawerButtons(
                          onTap: () {
                            Get.put(UserChatCOntroller());
                            Navigator.pushNamed(context, '/userAllChat');
                          },
                          icon: 'chat',
                          text: 'Chat',
                        ),
                        // DrawerButtons(
                        //   onTap: () {
                        //     Get.put(QuestionsChatCOntroller());
                        //     QuestionsChatCOntroller.to.getQuestionsSendReqUser(
                        //       navigate: true,
                        //     );
                        //   },
                        //   icon: 'contact_us',
                        //   text: 'Contact Us',
                        // ),
                        Divider(
                          color: primaryColor,
                          thickness: 1.h,
                          indent: 25.w,
                          endIndent: 25.w,
                          height: 25.h,
                        ),
                        DrawerButtons(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("phone");
                            prefs.remove("isuser");
                            prefs.remove("tokan");
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LogInPage()),
                                (Route<dynamic> route) => false);
                          },
                          icon: 'log_out',
                          text: 'Logout',
                        ),
                      ],
                    ),
                  ),
                ],
              )
            :
            // for lawyer
            ListView(
                padding: const EdgeInsets.all(0),
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          Scaffold.of(context).closeEndDrawer();
                        },
                        child: Container(
                          height: 40.w,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/icons/arrow_back.png',
                              height: 15.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 435.h,
                    width: 100.w,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: bgColor,
                      borderRadius: BorderRadius.circular(32.r),
                      border: Border.all(color: primaryColor, width: 2.w),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    child: Column(
                      children: [
                        DrawerButtons(
                          onTap: () {
                            Navigator.pushNamed(context, '/lawyermyprofile');
                          },
                          icon: 'profile',
                          text: 'My Profile',
                        ),
                        DrawerButtons(
                          onTap: () {
                            Navigator.pushNamed(context, '/editprofilelawer');
                          },
                          icon: 'change_password',
                          text: 'Change Password',
                        ),
                        DrawerButtons(
                          onTap: () {
                            Navigator.pushNamed(context, '/lawyerchat');
                          },
                          icon: 'chat',
                          text: 'Chat',
                        ),
                        Divider(
                          color: primaryColor,
                          thickness: 1.h,
                          indent: 25.w,
                          endIndent: 25.w,
                          height: 25.h,
                        ),
                        DrawerButtons(
                          onTap: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.remove("phone");
                            prefs.remove("isuser");
                            prefs.remove("tokan");
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LogInLawyer()),
                                (Route<dynamic> route) => false);
                          },
                          icon: 'log_out',
                          text: 'Logout',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class DrawerButtons extends StatelessWidget {
  const DrawerButtons({
    super.key,
    required this.onTap,
    required this.icon,
    required this.text,
    this.height,
  });
  final VoidCallback onTap;
  final String icon;
  final String text;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: ScreenUtil().screenWidth,
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Center(
          child: Row(
            children: [
              Container(
                width: 30.w,
                color: Colors.transparent,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    'assets/icons/$icon.png',
                    height: height ?? 15.h,
                  ),
                ),
              ),
              Text(
                text,
                style: CustomTextStyle.pc15bold,
              )
            ],
          ),
        ),
      ),
    );
  }
}
