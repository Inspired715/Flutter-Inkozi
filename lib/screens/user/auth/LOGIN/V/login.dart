// import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/screens/SPLASH/C/controller.dart';
import 'package:inkozi/screens/USER/AUTH/LOGIN/C/controller.dart';
import 'package:inkozi/screens/WELCOME/WEBVIEW/webview.dart';
import 'package:inkozi/screens/screens.dart';
import 'package:inkozi/widgets/ButtonWidget.dart';
import 'package:inkozi/widgets/us_phone_field.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../../widgets/header.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  static String verify = '';

  static String verifiedPhone = '';
  static String completePhone = '';

  static const String routeName = '/loginuser';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LogInPage(),
    );
  }

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  var phone = '';
  var completephone = '';
  bool isLoading = false;
  bool isHide = false;
  bool isPlaying = true;
  bool volumeOff = true;
  bool isdoubletap = false;
  bool isFullScreen = false;
  bool onBackward = false;
  bool animate = false;
  int i = 0;
  bool playBackSpeed = false;
  var height, width;
  late VideoPlayerController videoPlayerController;
  double playbackSpeed = 1.0;
  void setPlaybackSpeed(double speed) {
    playbackSpeed = speed;

    videoPlayerController.setPlaybackSpeed(speed);
  }

  void _enterFullScreenMode() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  void _exitFullScreenMode() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  String videoDuration(Duration duration) {
    String twodigits(int n) => n.toString().padLeft(2, '0');
    final hours = twodigits(duration.inHours);
    final minutes = twodigits(duration.inMinutes.remainder(60));
    final seconds = twodigits(duration.inSeconds.remainder(60));
    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(':');
  }

  void initvideoplayer() {
    load = true;
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse("${SplashController.to.videoUrl}"))
      ..initialize().then((_) {
        setState(() {});
      });
  }

  bool load = false;
  void loadvideo() {
    initvideoplayer();
  }

  @override
  void initState() {
    loadvideo();
    super.initState();
  }

  void disposecontroller() {
    videoPlayerController.pause();
    videoPlayerController.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void dispose() {
    disposecontroller();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
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
          body: OrientationBuilder(builder: (context, orientation) {
            return GetBuilder<LoginControllerUser>(initState: (state) {
              Get.put(LoginControllerUser());
              StaticValues.logginedChecker = false;
            }, builder: (obj) {
              return orientation == Orientation.landscape
                  ? videoPlayerWidget()
                  : Form(
                      key: formkey,
                      child: Stack(
                        children: [
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HeaderWithTitle(
                                      title: 'How it Works',
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Container(
                                        width: 380.w,
                                        height: 170.h,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            color: bgColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: headerBorderColor
                                                      .withOpacity(0.3),
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 10.r)
                                            ]),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20.sp),
                                          child: videoPlayerWidget(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.sp),
                                            color: bgColor,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: headerBorderColor
                                                      .withOpacity(0.3),
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 10.r)
                                            ]),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w,
                                              vertical: height * 0.02),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Text(
                                                  "What's your Number?",
                                                  style:
                                                      CustomTextStyle.pc20bold,
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Text(
                                                  "We 'll text a code to verify your number",
                                                  style: CustomTextStyle
                                                      .ts12normal,
                                                ),
                                                SizedBox(
                                                  height: 14.h,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Mobile",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 10.h,
                                                  ),
                                                  child: USPhoneNumberInput(
                                                    textInputAction:
                                                        TextInputAction.next,
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
                                                  children: [
                                                    Spacer(),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          StaticValues
                                                                  .logginedChecker =
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
                                                      style: CustomTextStyle
                                                          .ts12normal,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 30.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Expanded(
                                                      child: ButtonWithBg(
                                                        width: width,
                                                        btnName: 'Continue',
                                                        onPress: () {
                                                          if (formkey
                                                              .currentState!
                                                              .validate()) {
                                                            obj.performLogin(
                                                              navigate: true,
                                                              context: context,
                                                              verifiedPhone:
                                                                  phone,
                                                              completephone:
                                                                  completephone,
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "OR",
                                      style: CustomTextStyle.ts12normal,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  UserRegistrationPage(
                                                      verifiedPhone: null),
                                            ));
                                      },
                                      child: Text(
                                        "Create an account later",
                                        style: TextStyle(
                                            color: primaryColor,
                                            fontSize: 14.sp,
                                            decoration:
                                                TextDecoration.underline),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    Text(
                                      "By Tapping to Continue I Accept",
                                      style: CustomTextStyle.ts12normal,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: primaryColor,
                                                fontSize: 13.sp),
                                            children: [
                                          TextSpan(
                                            text: "Terms & Condition ",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => WebView(
                                                          title:
                                                              "Terms & Condition",
                                                          url:
                                                              "https://www.inkozi.com/page/terms-of-use"),
                                                    ));
                                              },
                                          ),
                                          TextSpan(
                                              text: ".",
                                              style:
                                                  TextStyle(fontSize: 20.sp)),
                                          TextSpan(
                                            text: " Privacy Policy",
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.underline),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) => WebView(
                                                          title:
                                                              "Privacy Policy",
                                                          url:
                                                              "https://www.inkozi.com/page/privacy-policy"),
                                                    ));
                                              },
                                          ),
                                        ]))
                                  ],
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                addPaddingWhenKeyboardAppears(),
                              ],
                            ),
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
            });
          }),
        ),
      ),
    );
  }

  SizedBox addPaddingWhenKeyboardAppears() {
    final viewInsets = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance.window.viewInsets,
      WidgetsBinding.instance.window.devicePixelRatio,
    );

    final bottomOffset = viewInsets.bottom;
    const hiddenKeyboard = 0.0;
    final isNeedPadding = bottomOffset != hiddenKeyboard;

    return SizedBox(height: isNeedPadding ? bottomOffset : hiddenKeyboard);
  }

  videoPlayerWidget() {
    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              setState(() {
                isHide = !isHide;
                playBackSpeed = false;
              });

              if (isHide) {
                Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    if (playBackSpeed) {
                      setState(() {
                        isHide = true;
                      });
                    } else {
                      setState(() {
                        isHide = false;
                      });
                    }
                  },
                );
              }
            },
            onDoubleTapDown: (details) {
              final tapPosition = details.localPosition.dx;
              final screenWidth = MediaQuery.of(context).size.width;

              final containerWidth = screenWidth * 0.8;
              if (tapPosition < containerWidth / 2) {
                setState(() {
                  onBackward = true;
                });
                final currentPosition = videoPlayerController.value.position;

                final newPosition =
                    currentPosition - const Duration(seconds: 10);
                videoPlayerController.seekTo(newPosition);
                print('Double-tapped on the left side');
              } else {
                setState(() {
                  isdoubletap = true;
                });
                if (isdoubletap) {
                  final currentPosition = videoPlayerController.value.position;
                  final newPosition =
                      currentPosition + const Duration(seconds: 5);
                  videoPlayerController.seekTo(newPosition);
                }

                print('Double-tapped on the right side');
              }

              if (onBackward || isdoubletap) {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    setState(() {
                      onBackward = false;
                      isdoubletap = false;
                    });
                  },
                );
              }
            },
            child: videoPlayerController.value.isInitialized
                ? VideoPlayer(videoPlayerController)
                : Center(
                    child: CircularProgressIndicator(
                    color: primaryColor,
                  ))),
        onBackward
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Image.asset(
                    'assets/images/back.png',
                    height: 70,
                  ),
                ),
              )
            : const SizedBox(),
        isdoubletap
            ? Align(
                alignment: Alignment.centerRight,
                child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Transform.rotate(
                      angle: 3.141,
                      child: Image.asset(
                        'assets/images/back.png',
                        height: 70,
                      ),
                    )),
              )
            : SizedBox(),
        isHide
            ? Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isPlaying = !isPlaying;
                    });
                    videoPlayerController.value.isPlaying ||
                            videoPlayerController.value.duration ==
                                videoPlayerController.value.position
                        ? videoPlayerController.pause()
                        : videoPlayerController.play();
                  },
                  child: Image.asset(
                    isPlaying
                        ? 'assets/images/pause.png'
                        : 'assets/images/play.png',
                    height: 70,
                  ),
                ),
              )
            : const SizedBox(),
        playBackSpeed
            ? Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 55, right: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        animate = true;
                      });
                    },
                    child: AnimatedContainer(
                      height: animate ? 100 : 30,
                      width: animate ? 100 : 200,
                      decoration: BoxDecoration(
                          color: Colors.transparent.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(8)),
                      duration: const Duration(milliseconds: 500),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: animate
                          ? SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.015,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 0;
                                        setPlaybackSpeed(0.5);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        i == 0
                                            ? const Row(
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        const Text(
                                          '0.5x',
                                          style: TextStyle(
                                            fontFamily: 'gesndbook',
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 1;
                                        setPlaybackSpeed(1.0);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        i == 1
                                            ? const Row(
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        const Text(
                                          '1x',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontFamily: 'gesndbook',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        i = 2;
                                        setPlaybackSpeed(1.5);
                                      });
                                    },
                                    child: Row(
                                      children: [
                                        i == 2
                                            ? const Row(
                                                children: [
                                                  Icon(
                                                    Icons.check,
                                                    size: 15,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                ],
                                              )
                                            : const SizedBox(),
                                        const Text(
                                          '1.5x',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              children: [
                                Image.asset(
                                  'assets/images/playbackspeed.png',
                                  height: 20,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                const Text(
                                  '2x',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                                const Spacer(),
                                const Text(
                                  '1x',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'gesndbook',
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 10,
                                  color: Colors.white,
                                )
                              ],
                            ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
        isHide
            ? Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 3,
                          child: VideoProgressIndicator(
                            colors:
                                VideoProgressColors(playedColor: Colors.white),
                            videoPlayerController,
                            allowScrubbing: false,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPlaying = !isPlaying;
                                    });
                                    videoPlayerController.value.isPlaying ||
                                            videoPlayerController
                                                    .value.duration ==
                                                videoPlayerController
                                                    .value.position
                                        ? videoPlayerController.pause()
                                        : videoPlayerController.play();
                                  },
                                  icon: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      volumeOff = !volumeOff;
                                    });
                                    if (volumeOff) {
                                      videoPlayerController.setVolume(1.0);
                                    } else {
                                      videoPlayerController.setVolume(0.0);
                                    }
                                  },
                                  icon: Icon(
                                    volumeOff
                                        ? Icons.volume_up
                                        : Icons.volume_off,
                                    color: Colors.white,
                                  ),
                                ),
                                ValueListenableBuilder(
                                  valueListenable: videoPlayerController,
                                  builder: (context, value, child) => Text(
                                    videoDuration(value.position),
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const Text(
                                  ' / ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  videoDuration(
                                      videoPlayerController.value.duration),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      playBackSpeed = !playBackSpeed;
                                    });
                                    if (playBackSpeed == false) {
                                      Future.delayed(
                                        const Duration(seconds: 3),
                                        () {
                                          setState(() {
                                            isHide = false;
                                          });
                                        },
                                      );
                                    }
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isFullScreen = !isFullScreen;
                                      if (isFullScreen) {
                                        _enterFullScreenMode();
                                      } else {
                                        _exitFullScreenMode();
                                      }
                                    });
                                  },
                                  icon: Icon(
                                    isFullScreen
                                        ? Icons.fullscreen_exit_rounded
                                        : Icons.fullscreen,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            : const SizedBox()
      ],
    );
  }
}

class BackAppBarINitScreen extends StatelessWidget
    implements PreferredSizeWidget {
  const BackAppBarINitScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => InitialScreen()),
              (Route<dynamic> route) => false);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      title: Image(
        image: AssetImage('assets/icons/mainlogo.png'),
        height: 70.h,
        width: 120.w,
        alignment: Alignment.center,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}
