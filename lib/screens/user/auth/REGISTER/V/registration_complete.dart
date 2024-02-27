import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/config.dart';
import 'package:inkozi/screens/WELCOME/WelcomePage.dart';
import 'package:inkozi/widgets/widget.dart';

class RegistrationComplete extends StatefulWidget {
  const RegistrationComplete({super.key});
  static const String routeName = '/registrationComplete';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => RegistrationComplete(),
    );
  }

  @override
  State<RegistrationComplete> createState() => _RegistrationCompleteState();
}

class _RegistrationCompleteState extends State<RegistrationComplete> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        endDrawer: DrawerWidget(),
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomHeaderWithTitle(
              title: 'Registered User',
            ),
            //
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: Container(
                color: bgColor,
                width: ScreenUtil().screenWidth,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      bottom: 100.h,
                      right: 0,
                      child: Image.asset(
                        'assets/icons/bg1.png',
                        height: 75.h,
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().screenHeight / 6,
                      right: 0,
                      child: Image.asset(
                        'assets/icons/bg2.png',
                        height: 75.h,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 20.w,
                      child: Image.asset(
                        'assets/icons/bg3.png',
                        height: 70.h,
                      ),
                    ),
                    Container(
                      height: 270.h,
                      margin: EdgeInsets.symmetric(horizontal: 25.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 18.h),
                      decoration: customDecoration(),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/tick.png',
                            height: 50.h,
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Text(
                            'Thanks you for registering with InKozi.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'Your profile is pending review. InKozi will Notify you shortly.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: textLightBlueGrey,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ButtonWithBg(
                            width: ScreenUtil().screenWidth,
                            btnName: 'Go to Login',
                            onPress: () {
                              Navigator.pushNamed(context, '/loginuser');
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

customDecoration({double? opacity}) {
  return BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      color: bgColor,
      boxShadow: [
        BoxShadow(
            color: primaryColor.withOpacity(opacity ?? 0.3),
            blurStyle: BlurStyle.outer,
            blurRadius: 10.r)
        // offset: Offset(0, 0))
      ]);
}
