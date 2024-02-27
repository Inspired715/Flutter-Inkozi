import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/text_style.dart';

import '../../UTILIS/colors.dart';
import '../../widgets/widget.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  static const String routeName = '/addphoto';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => AddPhoto(),
    );
  }

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWithTitle(
                title: '',
              ),

              //

              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/otpinputpage');
                          },
                          child: Container(
                            height: 120.h,
                            width: 120.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: btnContainerColor,
                                shape: BoxShape.rectangle),
                            child: Icon(
                              Icons.add_circle,
                              color: primaryColor,
                              size: 60.sp,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Add your photo",
                        style: CustomTextStyle.ts17normal,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ////////////
          SizedBox(
            height: 50.h,
          ),
          Transform.translate(
            offset: const Offset(50, 60),
            child: ButtonWithBg(
              btnName: 'Save',
              onPress: () {
                Navigator.pushNamed(context, '/findyourlawer');
              },
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}
