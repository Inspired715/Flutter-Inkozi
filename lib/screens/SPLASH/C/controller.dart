import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:inkozi/screens/USER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/screens/LAWYER/HOME/CHAT/C/controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inkozi/screens/LAWYER/AUTH/LOGIN/M/model.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/SPLASH/V/splash.dart';
import 'package:inkozi/screens/onboarding/launch_pageview.dart';
import 'package:inkozi/screens/screens.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class SplashController extends GetxController {
  static SplashController get to => Get.find();

  void checkuser(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? v = prefs.getString('tokan');
    bool? u = prefs.getBool('isuser');
    String? p = prefs.getString('phone');

    if (v == null && u == null && p == null) {
      Future.delayed(Duration(seconds: 7), () {
        if (firsttime) {
          Navigator.pushReplacement(
            context,
            PageTransition(
              const LaunchPageView(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            PageTransition(
              const InitialScreen(),
            ),
          );
        }
      });
    } else {
      StaticValues.tokan = v;
      StaticValues.phone = p;
      if (u!) {
        getProfileUser(p!, context).then((value) {
          log("it is user login....");
          StaticValues.isuser = true;
          Future.delayed(Duration(seconds: 7), () {
            Get.offAll(LawyerBySpecialSearch());
          });
        });
      } else {
        getProfileLawyer(p!, context).then((value) {
          log("it is lawyer login....");
          StaticValues.isuser = false;

          LawyerChatCOntroller.to.getQuestionsReceiveReqUser(
              StaticValues.lawyerInfo!.advisorId!, context, true);
        });
      }
    }
  }

  Future<void> getProfileUser(
    String phone,
    context,
  ) async {
    final apiUrl =
        "https://inkozi.com/api/01/fetch_user?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&phone=${phone}";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      UserModel model = UserModel.fromJson(responseData);
      StaticValues.userInfo = model.userInfo!;
    } else {
      showCustomSnackBar("session logout", isError: true);
    }
  }

  Future<void> getProfileLawyer(
    String phone,
    context,
  ) async {
    final apiUrl =
        "https://inkozi.com/api/01/fetch_service_provider?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&phone=${phone}";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      LawyerModel model = LawyerModel.fromJson(responseData);
      StaticValues.lawyerInfo = model.lawyerInfo!;
    } else {
      showCustomSnackBar("session logout", isError: true);
    }
  }

  String videoUrl = '';
  void getintrovideo() async {
    final apiUrl =
        "https://www.inkozi.com/api/01/introvideo?INKOZI-API-KEY=MG5tj4wNbrb48yFD100";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      videoUrl = responseData['video'];
      log("video url is ${videoUrl}");
    }
  }

  String splashvideoUrl = '';
  Future splashgetintrovideo() async {
    final apiUrl =
        "https://www.inkozi.com/api/01/loading_video?INKOZI-API-KEY=MG5tj4wNbrb48yFD100";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      splashvideoUrl = responseData['video'];
      log("splashvideoUrl url is ${videoUrl}");
      videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse("${splashvideoUrl}"))
            ..initialize().then((_) {
              update();
              videoPlayerController!.play();
              if (videoPlayerController!.value.position >=
                  videoPlayerController!.value.duration) {
                videoPlayerController!.pause();
              }
            });
    }
  }

  VideoPlayerController? videoPlayerController;
  var images_load;
  void getonboardingpages() async {
    final apiUrl =
        "https://www.inkozi.com/api/01/slide_images?INKOZI-API-KEY=MG5tj4wNbrb48yFD100";

    http.Response response = await http.get(
      Uri.parse(apiUrl),
    );

    if (response.statusCode == 200) {
      images_load = null;

      final responseData = json.decode(response.body);
      log("images_load is ${responseData['images_load']}");
      images_load = responseData['images_load'];
    }
  }

  bool firsttime = false;
  Future<bool> checkFirsttime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('firsttime') == null) {
      prefs.setBool('firsttime', true);
      firsttime = true;
      return firsttime;
    } else {
      firsttime = false;
      return firsttime;
    }
  }
}
