import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

class ButtonWithBg extends StatelessWidget {
  const ButtonWithBg({
    super.key,
    required this.btnName,
    required this.onPress,
    this.width,
    this.height,
  });
  final double? width;
  final double? height;
  final String btnName;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    // return OutlinedButton(
    //   onPressed: onPress,
    //   style: OutlinedButton.styleFrom(
    //       shadowColor: headerFillColor,
    //       padding: EdgeInsets.symmetric(vertical: 12),
    //       // fixedSize: Size.fromWidth(230),

    //       fixedSize: Size(width ?? 150.sp, height ?? 50.sp),
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.all(Radius.circular(10))),
    //       backgroundColor: primaryColor),
    //   child: Text(
    //     btnName,
    //     style: CustomTextStyle.bc20med,
    //   ),
    // );
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: width ?? 150.sp,
        height: height ?? 50.sp,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(10.sp),
          boxShadow: [
            BoxShadow(
              color: headerBorderColor.withOpacity(0.5),
              blurStyle: BlurStyle.outer,
              blurRadius: 10.r,
            ),
          ],
        ),
        child: Center(
          child: Text(
            btnName,
            style: CustomTextStyle.bc18bold,
          ),
        ),
      ),
    );
  }
}

// Button rectangle

class ButtonRectangle extends StatelessWidget {
  const ButtonRectangle({
    super.key,
    required this.btnName,
    required this.onPress,
  });

  final String btnName;
  final Function()? onPress;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        shadowColor: Color(0xFF242424),
        padding: EdgeInsets.symmetric(vertical: 8),
        fixedSize: Size.fromWidth(180),
        backgroundColor: primaryColor,
      ),
      child: Text(
        btnName,
        style: CustomTextStyle.bc22normal,
      ),
    );
  }
}

// Button Allow Deny

class BtnAllowDeny extends StatelessWidget {
  const BtnAllowDeny({
    super.key,
    required this.btnName,
    required this.onPress,
    required this.color,
  });

  final String btnName;
  final Function()? onPress;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      style: OutlinedButton.styleFrom(
        shadowColor: Color(0xFF242424),
        padding: EdgeInsets.symmetric(vertical: 8),
        fixedSize: Size.fromWidth(100),
        backgroundColor: color,
      ),
      child: Text(
        btnName,
        style: CustomTextStyle.bc18normal,
      ),
    );
  }
}

// Rounded Forward Button

class RoundedForwardBtn extends StatelessWidget {
  const RoundedForwardBtn({
    super.key,
    this.onTap,
    required this.width,
  });
  final Function()? onTap;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: width,
        ),
        Container(
          height: 70.h,
          width: 70.w,
          alignment: Alignment.centerRight,
          decoration: BoxDecoration(
              border: Border.all(color: primaryColor),
              color: primaryColor,
              shape: BoxShape.circle),
          child: Center(
            child: IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 35.sp,
              ),
              onPressed: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
