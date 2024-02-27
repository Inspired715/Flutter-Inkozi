import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config.dart';

// class CustomTextStyle {
//   static TextStyle tp32bold =
//       TextStyle(color: textPrimary, fontSize: 32, fontWeight: FontWeight.bold);
//   static TextStyle tp22bold =
//       TextStyle(color: textPrimary, fontSize: 22, fontWeight: FontWeight.bold);
//   static TextStyle tp16normal = TextStyle(
//       color: textPrimary, fontSize: 16, fontWeight: FontWeight.normal);

//   static TextStyle itc20normal = TextStyle(
//       color: inputTextColor, fontSize: 20, fontWeight: FontWeight.normal);

//   static TextStyle ts20normal = TextStyle(
//       color: textSecondary, fontSize: 20, fontWeight: FontWeight.normal);
//   static TextStyle ts22normal = TextStyle(
//       color: textSecondary, fontSize: 22, fontWeight: FontWeight.normal);
//   static TextStyle ts12normal = TextStyle(
//       color: textSecondary, fontSize: 12, fontWeight: FontWeight.normal);
//   static TextStyle ts13normal = TextStyle(
//     color: textSecondary,
//     fontSize: 13,
//     fontWeight: FontWeight.w500,
//     fontFamily: 'Roboto-Light',
//   );
//   static TextStyle ts15normal = TextStyle(
//       color: textSecondary, fontSize: 15, fontWeight: FontWeight.w500);
//   static TextStyle ts17normal = TextStyle(
//       color: textSecondary, fontSize: 17, fontWeight: FontWeight.normal);

//   static TextStyle pc25bold =
//       TextStyle(color: primaryColor, fontSize: 25, fontWeight: FontWeight.bold);
//   static TextStyle pc20bold =
//       TextStyle(color: primaryColor, fontSize: 20, fontWeight: FontWeight.bold);
//   static TextStyle pc15bold =
//       TextStyle(color: primaryColor, fontSize: 15, fontWeight: FontWeight.bold);
//   static TextStyle pc17med =
//       TextStyle(color: primaryColor, fontSize: 17, fontWeight: FontWeight.w500);
//   static TextStyle pc18normal = TextStyle(
//       color: primaryColor, fontSize: 18, fontWeight: FontWeight.normal);
//   static TextStyle pc12normal = TextStyle(
//       color: primaryColor, fontSize: 12, fontWeight: FontWeight.normal);

//   static TextStyle bc20med =
//       TextStyle(color: bgColor, fontSize: 20, fontWeight: FontWeight.w500);
//   static TextStyle bc22normal =
//       TextStyle(color: bgColor, fontSize: 30, fontWeight: FontWeight.normal);
//   static TextStyle bc18normal =
//       TextStyle(color: bgColor, fontSize: 18, fontWeight: FontWeight.normal);
//        static TextStyle bc18bold =
//       TextStyle(color: bgColor, fontSize: 18, fontWeight: FontWeight.bold);
//        static TextStyle bc12normal =
//       TextStyle(color: bgColor, fontSize: 12, fontWeight: FontWeight.normal);
//  static TextStyle bc15normal =
//       TextStyle(color: bgColor, fontSize: 15, fontWeight: FontWeight.normal);

//   static TextStyle tpr18normal = TextStyle(
//       color: textProfile, fontSize: 18, fontWeight: FontWeight.normal);
//   static TextStyle tpr18bold =
//       TextStyle(color: textProfile, fontSize: 18, fontWeight: FontWeight.w500);
//   static TextStyle tpr15normal = TextStyle(
//       color: textProfile, fontSize: 15, fontWeight: FontWeight.normal);
//   static TextStyle tpr20normal = TextStyle(
//       color: textProfile, fontSize: 20, fontWeight: FontWeight.normal);
// }

class CustomTextStyle {
  static TextStyle tp32bold = TextStyle(
      color: textPrimary, fontSize: 32.sp, fontWeight: FontWeight.bold);
  static TextStyle tp22bold = TextStyle(
      color: textPrimary, fontSize: 22.sp, fontWeight: FontWeight.bold);
  static TextStyle tp16normal = TextStyle(
      color: textPrimary, fontSize: 16.sp, fontWeight: FontWeight.normal);

  static TextStyle itc20normal = TextStyle(
      color: inputTextColor, fontSize: 20.sp, fontWeight: FontWeight.normal);

  static TextStyle ts20normal = TextStyle(
      color: textSecondary, fontSize: 20.sp, fontWeight: FontWeight.normal);
  static TextStyle ts22normal = TextStyle(
      color: textSecondary, fontSize: 22.sp, fontWeight: FontWeight.normal);
  static TextStyle ts12normal = TextStyle(
      color: textSecondary, fontSize: 12.sp, fontWeight: FontWeight.normal);
  static TextStyle ts10normal = TextStyle(
      color: textSecondary, fontSize: 10.sp, fontWeight: FontWeight.normal);
  static TextStyle ts13normal = TextStyle(
    color: textSecondary,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto-Light',
  );
  static TextStyle ts13normalblack = TextStyle(
    color: Colors.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'Roboto-Light',
  );
  static TextStyle ts15normal = TextStyle(
      color: textSecondary, fontSize: 15.sp, fontWeight: FontWeight.w500);
  static TextStyle ts17normal = TextStyle(
      color: textSecondary, fontSize: 17.sp, fontWeight: FontWeight.normal);

  static TextStyle pc25bold = TextStyle(
      color: primaryColor, fontSize: 25.sp, fontWeight: FontWeight.bold);
  static TextStyle pc20bold = TextStyle(
      color: primaryColor, fontSize: 20.sp, fontWeight: FontWeight.bold);
  static TextStyle pc15bold = TextStyle(
      color: primaryColor, fontSize: 15.sp, fontWeight: FontWeight.bold);
  static TextStyle pc16bold = TextStyle(
      color: primaryColor, fontSize: 16.sp, fontWeight: FontWeight.bold);
  static TextStyle pc17med = TextStyle(
      color: primaryColor, fontSize: 17.sp, fontWeight: FontWeight.w500);
  static TextStyle pc18normal = TextStyle(
      color: primaryColor, fontSize: 18.sp, fontWeight: FontWeight.normal);
  static TextStyle pc12normal = TextStyle(
      color: primaryColor, fontSize: 12.sp, fontWeight: FontWeight.normal);

  static TextStyle bc20med =
      TextStyle(color: bgColor, fontSize: 20.sp, fontWeight: FontWeight.w500);
  static TextStyle bc18med =
      TextStyle(color: bgColor, fontSize: 18.sp, fontWeight: FontWeight.w500);
  static TextStyle bc16med =
      TextStyle(color: bgColor, fontSize: 16.sp, fontWeight: FontWeight.w500);
  static TextStyle bc14med =
      TextStyle(color: bgColor, fontSize: 14.sp, fontWeight: FontWeight.w500);
  static TextStyle bc22normal =
      TextStyle(color: bgColor, fontSize: 30.sp, fontWeight: FontWeight.normal);
  static TextStyle bc18normal =
      TextStyle(color: bgColor, fontSize: 18.sp, fontWeight: FontWeight.normal);
  static TextStyle bc18bold =
      TextStyle(color: bgColor, fontSize: 18.sp, fontWeight: FontWeight.bold);
  static TextStyle bc12normal =
      TextStyle(color: bgColor, fontSize: 12.sp, fontWeight: FontWeight.normal);
  static TextStyle bc15normal =
      TextStyle(color: bgColor, fontSize: 15.sp, fontWeight: FontWeight.normal);

  static TextStyle tpr18normal = TextStyle(
      color: textProfile, fontSize: 18.sp, fontWeight: FontWeight.normal);
  static TextStyle tpr18bold = TextStyle(
      color: textProfile, fontSize: 18.sp, fontWeight: FontWeight.w500);
  static TextStyle tpr15normal = TextStyle(
      color: textProfile, fontSize: 15.sp, fontWeight: FontWeight.normal);
  static TextStyle tpr20normal = TextStyle(
      color: textProfile, fontSize: 20.sp, fontWeight: FontWeight.normal);
}





// TextStyle mainStyle(double size, weight,
//     {Color? color,TextDecoration? decoration, FontStyle? fontStyle, String? fontFamily,double? textHeight,double? decorationThickness}) {
//   return TextStyle(
//     fontFamily: fontFamily ?? 'Tajawal',
//     fontSize: size.sp,
//     fontWeight: weight,
//     color: color??Colors.black,
//     decoration: decoration,
//     fontStyle: fontStyle,
//     height:textHeight?? 1.2,
//     decorationThickness: decorationThickness
//     // wordSpacing: 4.0

//   );


// }