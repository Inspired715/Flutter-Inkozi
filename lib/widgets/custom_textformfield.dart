import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    this.title,
    required this.controller,
    this.obscureText,
    this.validator,
    required this.enableTitle,
    this.hintText,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
  });
  final String? title;
  final bool enableTitle;
  final String? hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        enableTitle
            ? Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      title ?? '',
                      style: TextStyle(
                        color: textBlueGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                ],
              )
            : SizedBox(),
        TextFormField(
          obscureText: obscureText ?? false,
          controller: controller,
          validator: validator,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          style: TextStyle(
            fontSize: 14.sp,
            color: textBlueGrey,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: primaryColor,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.w,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: Colors.red,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: primaryColor,
                width: 1.w,
              ),
            ),
            hintText: hintText,
            fillColor: Color(0xffF3E5F4),
            filled: true,
          ),
        )
      ],
    );
  }
}
