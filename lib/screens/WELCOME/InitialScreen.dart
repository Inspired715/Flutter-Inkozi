import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/C/controller.dart';

import '../../widgets/widget.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  static const String routeName = '/initial';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => InitialScreen(),
    );
  }

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  TextEditingController phoneController = TextEditingController();

  bool alertDialogShown = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Get.put(LawyerChatCOntroller());

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: SizedBox(),
          action: SizedBox(),
        ),
        body: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWithTitle(
                  title: 'Local Providers On-Demand',
                ),
                SizedBox(
                  height: 70.h,
                ),
              ],
            ),
            Center(
              child: Container(
                width: 300.w,
                height: 280.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.sp),
                    color: bgColor,
                    boxShadow: [
                      BoxShadow(
                          color: headerBorderColor.withOpacity(0.3),
                          blurStyle: BlurStyle.outer,
                          blurRadius: 10.r)
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'Are you Logging as Service\n           Provider or User',
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 10.h, 20.w, 20.h),
                        child: ButtonWithBg(
                          width: width,
                          btnName: 'Professionals',
                          onPress: () {
                            Navigator.pushNamed(context, '/loginlawyer');
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                        child: ButtonWithBg(
                          btnName: 'User',
                          width: width,
                          onPress: () {
                            Navigator.pushNamed(context, '/loginuser');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
