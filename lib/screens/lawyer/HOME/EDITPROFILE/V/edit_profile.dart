import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/screens/LAWYER/HOME/EDITPROFILE/C/controller.dart';
import 'package:inkozi/screens/USER/AUTH/REGISTER/V/registration_complete.dart';
import 'package:inkozi/widgets/ButtonWidget.dart';
import 'package:inkozi/widgets/CustomAppBar.dart';
import 'package:inkozi/widgets/DrawerWidget.dart';
import 'package:inkozi/widgets/custom_textformfield.dart';
import '../../../../../widgets/header.dart';

class EditProfileLAwyer extends StatefulWidget {
  const EditProfileLAwyer({super.key});

  static const String routeName = '/editprofilelawer';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => EditProfileLAwyer(),
    );
  }

  @override
  State<EditProfileLAwyer> createState() => _EditProfileLAwyerState();
}

class _EditProfileLAwyerState extends State<EditProfileLAwyer> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: GetBuilder<EditProfileLAwyerController>(initState: (state) {
          Get.put(EditProfileLAwyerController());
          EditProfileLAwyerController.to.firstNameController.text =
              StaticValues.lawyerInfo!.firstName!;
          EditProfileLAwyerController.to.lastNameController.text =
              StaticValues.lawyerInfo!.lastName!;
        }, builder: (obj) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderWithTitle(
                      title: 'Edit Profile',
                    ),

                    //
                    Container(
                      margin: EdgeInsets.all(30),
                      decoration: customDecoration(),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 25.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            QuestionHead(
                              question: "What's your name?",
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  title: Text(
                                    'Why We Need Name',
                                    style: CustomTextStyle.tpr20normal,
                                  ),
                                  content: Text(
                                    'Lorem ipsum is simply dummy text of the printing ipsum is simply dummy text of the printing',
                                    style: CustomTextStyle.ts12normal,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextField(
                                    controller: obj.firstNameController,
                                    enableTitle: false,
                                    hintText: 'First Name',
                                  ),
                                  SizedBox(
                                    height: 15.h,
                                  ),
                                  CustomTextField(
                                    controller: obj.lastNameController,
                                    enableTitle: false,
                                    hintText: 'Last Name',
                                  ),
                                ],
                              ),
                            ),
                            //
                            QuestionHead(
                              question: "Change your password?",
                              onTap: () => showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  title: Text(
                                    'Why We Need Phone Number',
                                    style: CustomTextStyle.tpr20normal,
                                  ),
                                  content: Text(
                                    'Lorem ipsum is simply dummy text of the printing ipsum is simply dummy text of the printing',
                                    style: CustomTextStyle.ts12normal,
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomTextField(
                              enableTitle: false,
                              controller: passwordController,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ButtonWithBg(
                              width: ScreenUtil().screenWidth,
                              btnName: 'Change Password',
                              onPress: () {
                                // obj.updateProfile(context);
                              },
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            // Padding(
                            //     padding: const EdgeInsets.symmetric(vertical: 15),
                            //     child: TextFormField(
                            //       decoration: InputDecoration(
                            //         border: OutlineInputBorder(
                            //           borderSide: BorderSide(),
                            //           borderRadius: BorderRadius.all(
                            //               Radius.circular(
                            //                   8.0)), // Add border radius
                            //         ),
                            //         hintText: 'Password',
                            //         hintStyle: CustomTextStyle.ts20normal,
                            //       ),
                            //     )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                ////////////
                // SizedBox(
                //   height: 150.h,
                // ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       //       Text(
                //       //         'Find your Lawyer',
                //       //         style: CustomTextStyle.tpr20normal,
                //       //       ),
                //       //       SizedBox(
                //       //         width: 30.w,
                //       //       ),
                //       RoundedForwardBtn(
                //         width: 0,
                //         onTap: () {
                //           obj.updateProfile(context);
                //           // Navigator.pushNamed(context, '/lawyermyprofile');
                //         },
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        }),
        drawer: DrawerWidget(),
      ),
    );
  }
}

////
class QuestionHead extends StatelessWidget {
  const QuestionHead({
    super.key,
    required this.question,
    this.onTap,
  });

  final String question;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            question,
            style: CustomTextStyle.pc20bold,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              height: 20.h,
              width: 20.w,
              decoration: BoxDecoration(
                  border: Border.all(color: textPrimary),
                  color: bgColor,
                  shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.question_mark_outlined,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
