import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';

import 'package:inkozi/UTILIS/text_style.dart';
import '../../widgets/widget.dart';

class IntroToProviders extends StatefulWidget {
  const IntroToProviders({super.key});

  static const String routeName = '/introtoproviders';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => IntroToProviders(),
    );
  }

  @override
  State<IntroToProviders> createState() => _IntroToProvidersState();
}

class _IntroToProvidersState extends State<IntroToProviders> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
                  title: 'Introduction Yourself To Providers',
                ),

                //

                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "InKozi is all about your privacy building real-time connections between real providers near you.",
                        style: CustomTextStyle.tpr15normal,
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Please add a photo or use the default image.",
                          textAlign: TextAlign.center,
                          style: CustomTextStyle.tpr15normal,
                        ),
                      ),
                      makeInput(
                        hintText: 'First Name',
                        controller: firstNameController,
                      ),
                      makeInput(
                        hintText: 'Last Name',
                        controller: lastNameController,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfilePicBtn(
                              onTap: () {},
                              image: AssetImage('assets/icons/imgicon.png'),
                              tilte: 'Upload Profile Picture',
                            ),
                            ProfilePicBtn(
                              onTap: () {},
                              image: AssetImage('assets/icons/logocolor.png'),
                              tilte: 'Use Default Image',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ////////////

            RoundedForwardBtn(
              width: 240.w,
              onTap: () {
                Navigator.pushNamed(context, '/providersthanks');
              },
            ),
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}

//// Profile picture change button

class ProfilePicBtn extends StatelessWidget {
  const ProfilePicBtn({
    super.key,
    this.onTap,
    required this.image,
    required this.tilte,
  });

  final Function()? onTap;
  final AssetImage image;
  final String tilte;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 60.h,
            width: 60.w,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xffF5F5F5)),
                color: bgColor,
                boxShadow: [
                  BoxShadow(blurRadius: 3, color: inputTextColor),
                ],
                shape: BoxShape.circle),
            child: Center(
              child: Image(
                image: image,
                height: 30.h,
                width: 30.w,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        SizedBox(
          height: 80.h,
          width: 100.w,
          child: Text(
            tilte,
            textAlign: TextAlign.center,
            style: CustomTextStyle.tpr15normal,
          ),
        )
      ],
    );
  }
}
