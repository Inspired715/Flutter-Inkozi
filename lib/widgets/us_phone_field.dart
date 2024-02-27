import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class USPhoneNumberInput extends StatelessWidget {
  final String? title;
  final bool enableTitle;
  final String? hintText;
  final TextEditingController controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  USPhoneNumberInput({
    this.title,
    required this.controller,
    required this.onChanged,
    this.obscureText,
    this.validator,
    required this.enableTitle,
    this.hintText,
    this.textInputAction,
    this.focusNode,
    this.onEditingComplete,
  });

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
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: textInputAction,
          onEditingComplete: onEditingComplete,
          focusNode: focusNode,
          onChanged: onChanged,
          inputFormatters: [
            LengthLimitingTextInputFormatter(14),
            FilteringTextInputFormatter.digitsOnly,
            InternationalPhoneFormatter(),
          ],
          obscureText: obscureText ?? false,
          controller: controller,
          validator: validator,
          style: TextStyle(
            fontSize: 14.sp,
            color: textBlueGrey,
            fontWeight: FontWeight.w500,
          ),
          cursorColor: primaryColor,
          decoration: InputDecoration(
            prefixText: '+1 ',
            prefixStyle: TextStyle(
              fontSize: 14.sp,
              color: textBlueGrey,
              fontWeight: FontWeight.w500,
            ),
            isDense: enableTitle ? true : null,
            contentPadding: enableTitle ? EdgeInsets.all(14) : null,
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
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: greyTextColor,
              fontWeight: FontWeight.w500,
            ),
            fillColor: Color(0xffF3E5F4),
            filled: true,
          ),
        )
      ],
    );
  }
}

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(String value) {
    String nums = value.replaceAll(RegExp(r'[\D]'), '');

    String internationalPhoneFormatted = nums.length >= 1
        ? '(' +
            nums.substring(0, nums.length >= 3 ? 3 : null) +
            (nums.length > 3 ? ') ' : '') +
            (nums.length > 3
                ? nums.substring(3, nums.length >= 6 ? 6 : null) +
                    (nums.length > 6
                        ? '-' + nums.substring(6, nums.length >= 10 ? 10 : null)
                        : '')
                : '')
        : nums;

    return internationalPhoneFormatted;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: new TextSelection.collapsed(
            offset: internationalPhoneFormat(text).length));
  }
}
