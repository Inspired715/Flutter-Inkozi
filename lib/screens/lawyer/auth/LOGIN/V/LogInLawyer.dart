import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/WELCOME/InitialScreen.dart';
import 'package:inkozi/screens/lawyer/auth/login/C/controller.dart';
import 'package:inkozi/screens/user/auth/LOGIN/V/login.dart';
import 'package:inkozi/widgets/us_phone_field.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../../../widgets/widget.dart';

class LogInLawyer extends StatefulWidget {
  const LogInLawyer({super.key});

  static const String routeName = '/loginlawyer';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LogInLawyer(),
    );
  }

  @override
  State<LogInLawyer> createState() => _LogInLawyerState();
}

class _LogInLawyerState extends State<LogInLawyer> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  var phone = '';
  var completephone = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => InitialScreen()),
            (Route<dynamic> route) => false);

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: BackAppBarINitScreen(),
          body: GetBuilder<LoginControllerLawyer>(initState: (state) {
            Get.put(LoginControllerLawyer());
            StaticValues.logginedChecker = false;
          }, builder: (obj) {
            return Form(
              key: formkey,
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderWithTitle(
                        title: 'Welcome Back',
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        child: Container(
                          width: 380.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.sp),
                              color: bgColor,
                              boxShadow: [
                                BoxShadow(
                                    color: headerBorderColor.withOpacity(0.3),
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 10.r)
                                // offset: Offset(0, 0))
                              ]),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 10),
                            child: SingleChildScrollView(
                              physics: NeverScrollableScrollPhysics(),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Welcome Back",
                                    style: CustomTextStyle.pc20bold,
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Text(
                                    "Log into your existing InKozi account",
                                    style: TextStyle(
                                        color: greyTextColor, fontSize: 16.sp),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Phone No.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),

                                  //
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                    ),
                                    child: USPhoneNumberInput(
                                      textInputAction: TextInputAction.next,
                                      onChanged: (v) {
                                        phone = v;
                                      },
                                      enableTitle: false,
                                      title: 'Phone',
                                      validator: (value) {
                                        if (value != null &&
                                            value.length == 14) {
                                          return null;
                                        } else {
                                          return 'Enter a valid phone number';
                                        }
                                      },
                                      controller: phoneController,
                                      hintText: '(000) 000-0000',
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(() {
                                                StaticValues.logginedChecker =
                                                    !StaticValues
                                                        .logginedChecker;
                                              });
                                            },
                                            child: Icon(
                                              StaticValues.logginedChecker ==
                                                      false
                                                  ? Icons
                                                      .check_box_outline_blank
                                                  : Icons.check_box,
                                              color: primaryColor,
                                            ),
                                          ),
                                          Text(
                                            "Keep me Loogged in",
                                            style: CustomTextStyle.ts12normal,
                                          ),
                                        ],
                                      ),
                                      // Text(
                                      //   "Change Number",
                                      //   style: TextStyle(color: primaryColor),
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ButtonWithBg(
                                          width: width,
                                          btnName: 'Login',
                                          onPress: () {
                                            if (formkey.currentState!
                                                .validate()) {
                                              obj.performLogin(
                                                  navigate: true,
                                                  context: context,
                                                  verifiedPhone: phone,
                                                  completephone: completephone);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/registerlawyer');
                                    },
                                    child: Text(
                                      "Create an account later",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontSize: 14.sp,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // RoundedForwardBtn(
                      //   width: 250.w,
                      //   onTap: () {
                      //     obj.sendOTP(context, phone, completephone);
                      //   },
                      // ),
                    ],
                  ),
                  obj.loading == true
                      ? Container(
                          height: height,
                          width: width,
                          color: primaryColor.withOpacity(0.1),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: primaryColor,
                          )),
                        )
                      : const SizedBox()
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
