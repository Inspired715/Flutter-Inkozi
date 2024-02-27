import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/UTILIS/config.dart';
import 'package:inkozi/screens/USER/AUTH/REGISTER/C/controller.dart';
import 'package:inkozi/screens/screens.dart';
import 'package:inkozi/widgets/custom_textformfield.dart';
import 'package:inkozi/widgets/us_phone_field.dart';
import '../../../../../widgets/widget.dart';

class UserRegistrationPage extends StatefulWidget {
  final String? verifiedPhone;

  const UserRegistrationPage({super.key, required this.verifiedPhone});

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late FocusNode _firstNameFocus;
  late FocusNode _lastNameFocus;
  late FocusNode _userNameFocus;
  late FocusNode _phoneFocus;
  late FocusNode _passwordFocus;
  late FocusNode _emailFocus;
  SizedBox addPaddingWhenKeyboardAppears() {
    final viewInsets = EdgeInsets.fromWindowPadding(
      WidgetsBinding.instance.window.viewInsets,
      WidgetsBinding.instance.window.devicePixelRatio,
    );

    final bottomOffset = viewInsets.bottom;
    const hiddenKeyboard = 0.0; // Always 0 if keyboard is not opened
    final isNeedPadding = bottomOffset != hiddenKeyboard;

    return SizedBox(height: isNeedPadding ? bottomOffset : hiddenKeyboard);
  }

  @override
  void initState() {
    Get.put(RegistrationController());

    super.initState();
    if (widget.verifiedPhone != null) {
      RegistrationController.to.phoneController.text = widget.verifiedPhone!;
    }
    _firstNameFocus = FocusNode();
    _lastNameFocus = FocusNode();
    _emailFocus = FocusNode();
    _userNameFocus = FocusNode();
    _phoneFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _phoneFocus.dispose();
    _userNameFocus.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  String phone = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: GetBuilder<RegistrationController>(
            initState: (state) {},
            builder: (obj) {
              return Form(
                key: _formKey,
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomHeaderWithTitle(
                          title: 'Know Your Legal Rights',
                        ),
                        //
                        SizedBox(
                          height: 30.h,
                        ),
                        Expanded(
                          child: Container(
                            color: bgColor,
                            width: ScreenUtil().screenWidth,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  bottom: 100.h,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/icons/bg1.png',
                                    height: 75.h,
                                  ),
                                ),
                                Positioned(
                                  top: ScreenUtil().screenHeight / 6,
                                  right: 0,
                                  child: Image.asset(
                                    'assets/icons/bg2.png',
                                    height: 75.h,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 20.w,
                                  child: Image.asset(
                                    'assets/icons/bg3.png',
                                    height: 70.h,
                                  ),
                                ),
                                Container(
                                  height: 480.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 25.w),
                                  decoration: customDecoration(),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 30.w, vertical: 18.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Free registration",
                                          style: CustomTextStyle.pc20bold,
                                        ),
                                        SizedBox(height: 10.h),
                                        Expanded(
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: CustomTextField(
                                                        focusNode:
                                                            _firstNameFocus,
                                                        onEditingComplete: () {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  _lastNameFocus);
                                                        },
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        enableTitle: true,
                                                        title: 'First',
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Enter first name';
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        controller: obj
                                                            .firstNameController,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15.w),
                                                    Expanded(
                                                      child: CustomTextField(
                                                        focusNode:
                                                            _lastNameFocus,
                                                        onEditingComplete: () {
                                                          FocusScope.of(context)
                                                              .requestFocus(
                                                                  _userNameFocus);
                                                        },
                                                        textInputAction:
                                                            TextInputAction
                                                                .next,
                                                        enableTitle: true,
                                                        title: 'Last',
                                                        validator: (value) {
                                                          if (value == null ||
                                                              value.isEmpty) {
                                                            return 'Enter last name';
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        controller: obj
                                                            .lastNameController,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 10.h),

                                                CustomTextField(
                                                  focusNode: _userNameFocus,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _phoneFocus);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  enableTitle: true,
                                                  title: 'Username',
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return 'Enter username';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  controller:
                                                      obj.usernameController,
                                                ),
                                                SizedBox(height: 10.h),

                                                USPhoneNumberInput(
                                                  focusNode: _phoneFocus,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _emailFocus);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  onChanged: (v) {
                                                    phone = v;
                                                  },
                                                  enableTitle: true,
                                                  title: 'Phone',
                                                  validator: (value) {
                                                    if (value != null &&
                                                        value.length == 14) {
                                                      return null;
                                                    } else {
                                                      return 'Enter a valid phone number';
                                                    }
                                                  },
                                                  controller:
                                                      obj.phoneController,
                                                  hintText: '(000) 000-0000',
                                                ),
                                                SizedBox(height: 10.h),
                                                CustomTextField(
                                                  focusNode: _emailFocus,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _passwordFocus);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  enableTitle: true,
                                                  title: 'Email',
                                                  validator: validateEmail,
                                                  controller:
                                                      obj.emailController,
                                                ),
                                                SizedBox(height: 10.h),
                                                CustomTextField(
                                                  focusNode: _passwordFocus,
                                                  onEditingComplete: () {
                                                    FocusScope.of(context)
                                                        .requestFocus(
                                                            _firstNameFocus);
                                                  },
                                                  textInputAction:
                                                      TextInputAction.next,
                                                  enableTitle: true,
                                                  title: 'Password',
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.isEmpty ||
                                                        value.length < 6) {
                                                      return 'Enter 6 digit password';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  controller:
                                                      obj.passwordController,
                                                  obscureText: true,
                                                ),

                                                //
                                                SizedBox(height: 20.h),
                                                ButtonWithBg(
                                                  width:
                                                      ScreenUtil().screenWidth,
                                                  btnName: 'Save',
                                                  onPress: () {
                                                    phone = phone.replaceAll(
                                                        RegExp(r'\D'), '');

                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      obj.registerUser(
                                                          phone, context);
                                                    }
                                                  },
                                                ),
                                                addPaddingWhenKeyboardAppears(),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
            }),
      ),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }

  customDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: bgColor,
        boxShadow: [
          BoxShadow(
              color: primaryColor.withOpacity(0.3),
              blurStyle: BlurStyle.outer,
              blurRadius: 10.r)
          // offset: Offset(0, 0))
        ]);
  }
}


/////
///
