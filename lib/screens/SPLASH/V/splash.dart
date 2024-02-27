import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/screens/SPLASH/C/controller.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/C/controller.dart';
import 'package:inkozi/screens/lawyer/auth/login/C/controller.dart';
import 'package:video_player/video_player.dart';

class MyCustomSplashScreen extends StatefulWidget {
  const MyCustomSplashScreen({super.key});

  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MyCustomSplashScreen(),
    );
  }

  @override
  _MyCustomSplashScreenState createState() => _MyCustomSplashScreenState();
}

class _MyCustomSplashScreenState extends State<MyCustomSplashScreen> {
  @override
  void initState() {
    Get.put(LoginControllerUser());
    Get.put(LoginControllerLawyer());
    SplashController.to.getintrovideo();
    super.initState();

    Get.put(LawyerChatCOntroller());
    SplashController.to.checkuser(context);
  }

  @override
  void dispose() {
    SplashController.to.videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GetBuilder<SplashController>(builder: (context) {
        return Container(
          height: height,
          width: width,
          decoration: BoxDecoration(color: Colors.white),
          child: SplashController.to.videoPlayerController == null
              ? SizedBox()
              : VideoPlayer(SplashController.to.videoPlayerController!),
        );
      }),
    );
  }
}

class PageTransition extends PageRouteBuilder {
  final Widget page;

  PageTransition(this.page)
      : super(
          pageBuilder: (context, animation, anotherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 2000),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation = CurvedAnimation(
              curve: Curves.fastLinearToSlowEaseIn,
              parent: animation,
            );
            return Align(
              alignment: Alignment.bottomCenter,
              child: SizeTransition(
                sizeFactor: animation,
                axisAlignment: 0,
                child: page,
              ),
            );
          },
        );
}
