import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/screens/SPLASH/C/controller.dart';
import 'package:inkozi/screens/WELCOME/InitialScreen.dart';

class LaunchPageView extends StatefulWidget {
  const LaunchPageView({super.key});

  @override
  State<LaunchPageView> createState() => _LaunchPageViewState();
}

class _LaunchPageViewState extends State<LaunchPageView> {
  PageController controller = PageController(initialPage: 0);
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "1",
        onPressed: () {
          if (SplashController.to.images_load.length - 1 != i) {
            controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear);
          } else {
            Get.offAll(
              InitialScreen(),
              transition: Transition.leftToRight,
            );
          }
        },
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: primaryColor,
        shape: const CircleBorder(), // Set background color to pink
        child: Icon(
          SplashController.to.images_load.length - 1 == i
              ? Icons.check
              : Icons.arrow_forward_rounded,
          size: 20.sp,
          color: Colors.white, // Set icon color to white
        ), // Make the button circular
      ),
      body: Stack(
        children: [
          Container(
            height: ScreenUtil().screenHeight,
            width: ScreenUtil().screenWidth,
            child: PageView(
              controller: controller,
              onPageChanged: (val) {
                setState(() {
                  i = val;
                });
              },
              children: List.generate(
                SplashController.to.images_load.length,
                (index) => SizedBox(
                  height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  child: Image(
                    image: NetworkImage(SplashController.to.images_load[index]),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  Get.offAll(
                    InitialScreen(),
                    transition: Transition.leftToRight,
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(21.r),
                  ),
                  child: Container(
                    width: 58.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21.r),
                      color: Color(0xff84008c),
                    ),
                    child: Center(
                      child: Text(
                        "Skip",
                        style: CustomTextStyle.bc12normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
