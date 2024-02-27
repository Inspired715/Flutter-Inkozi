import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../widgets/widget.dart';

class FindYourLawyer extends StatefulWidget {
  const FindYourLawyer({super.key});

  static const String routeName = '/findyourlawer';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => FindYourLawyer(),
    );
  }

  @override
  State<FindYourLawyer> createState() => _FindYourLawyerState();
}

class _FindYourLawyerState extends State<FindYourLawyer> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController stateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWithTitle(
                  title: 'Find Your Lawer',
                ),

                //

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
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
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 130.w,
                              child: TextField(
                                controller: firstNameController,
                                style: CustomTextStyle.ts22normal,
                                decoration: InputDecoration(
                                  hintText: 'Bert',
                                  hintStyle: CustomTextStyle.itc20normal,
                                  suffixIcon: IconButton(
                                    onPressed: firstNameController.clear,
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 130.w,
                              child: TextField(
                                controller: firstNameController,
                                style: CustomTextStyle.ts22normal,
                                decoration: InputDecoration(
                                  hintText: 'Bert',
                                  hintStyle: CustomTextStyle.itc20normal,
                                  suffixIcon: IconButton(
                                    onPressed: firstNameController.clear,
                                    icon: Icon(Icons.clear),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      QuestionHead(
                        question: "What's your phone number?",
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
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: IntlPhoneField(
                            flagsButtonPadding: const EdgeInsets.all(8),
                            dropdownIconPosition: IconPosition.leading,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8.0)), // Add border radius
                              ),
                              hintText: '(xxx) xxx - xxxx',
                              hintStyle: CustomTextStyle.ts20normal,
                            ),
                            initialCountryCode: 'US',
                            onChanged: (phone) {
                              print(phone.completeNumber);
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
            ////////////
            SizedBox(
              height: 150.h,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Find your Lawyer',
                    style: CustomTextStyle.tpr20normal,
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  RoundedForwardBtn(
                    width: 0,
                    onTap: () {
                      Navigator.pushNamed(context, '/lawyermyprofile');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
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
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            question,
            style: CustomTextStyle.tpr20normal,
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
              )),
            ),
          ),
        ],
      ),
    );
  }
}
