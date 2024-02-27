import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

Widget makeInput({hintText, controller, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(blurRadius: 5, color: inputTextColor),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          controller: controller,
          style: CustomTextStyle.ts22normal,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bgColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: bgColor,
              ),
            ),

            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: borderColor),
            // ),
            hintText: hintText,
            hintStyle: CustomTextStyle.itc20normal,
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      )
    ],
  );
}

// Search Input Field

Widget searchInput({hintText, controller, obscureText = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        decoration: BoxDecoration(
          color: bgColor,
          boxShadow: [
            BoxShadow(blurRadius: 5, color: inputTextColor),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          controller: controller,
          style: CustomTextStyle.ts22normal,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: bgColor),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: bgColor,
              ),
            ),

            // border: OutlineInputBorder(
            //   borderSide: BorderSide(color: borderColor),
            // ),
            hintText: hintText,
            hintStyle: CustomTextStyle.itc20normal,
          ),
        ),
      ),
      SizedBox(
        height: 20.h,
      )
    ],
  );
}
