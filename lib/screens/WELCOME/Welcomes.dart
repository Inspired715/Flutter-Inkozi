import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';

import 'package:inkozi/UTILIS/text_style.dart';
import '../../widgets/widget.dart';

class Welcomes extends StatefulWidget {
  const Welcomes({super.key});

  static const String routeName = '/welcomes';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => Welcomes(),
    );
  }

  @override
  State<Welcomes> createState() => _WelcomesState();
}

class _WelcomesState extends State<Welcomes> {
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
                title: 'Service Providers On-Demand Arounf Every Corner',
              ),

              //

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to Inkozi!",
                      style: CustomTextStyle.tp22bold,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        "A Lawyer Around Every Corner",
                        style: CustomTextStyle.tp16normal,
                      ),
                    ),

                    //
                    LocationApproval(),
                  ],
                ),
              ),
            ],
          ),
          ////////////
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100.h,
              ),
              ButtonRectangle(
                btnName: 'Start Now',
                onPress: () {
                  Navigator.pushNamed(context, '/introtoproviders');
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Location Approval
class LocationApproval extends StatelessWidget {
  const LocationApproval({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 55),
      child: Container(
        height: 150.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(25),
          color: primaryColor,
          boxShadow: [
            // Add box shadow
            BoxShadow(
              color: inputTextColor.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/icons/locationbg.png'),
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    height: 50.h,
                    width: 180.w,
                    child: Text(
                      "Allow Inkozi to access this device's Location?",
                      maxLines: 2,
                      style: CustomTextStyle.bc18normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnAllowDeny(
                    btnName: 'Deny',
                    onPress: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    color: btnBgColor,
                  ),
                  BtnAllowDeny(
                    btnName: 'Allow',
                    onPress: () {
                      Navigator.pushNamed(context, '/introtoproviders');
                    },
                    color: btnBgColor,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
