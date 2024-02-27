import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inkozi/screens/USER/HOME/LAWERSEARCH/C/controller.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import '../../widgets/widget.dart';

// class WelcomePage extends StatefulWidget {
//   const WelcomePage({super.key});

//   static const String routeName = '/welcomepage';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => WelcomePage(),
//     );
//   }

//   @override
//   State<WelcomePage> createState() => _WelcomePageState();
// }

// class _WelcomePageState extends State<WelcomePage> {
//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return WillPopScope(
//       onWillPop: () async {
//         SystemNavigator.pop();
//         return true;
//       },
//       child: SafeArea(
//         child: Scaffold(
//           appBar: CustomAppBar(
//             leading: Padding(
//               padding: EdgeInsets.only(top: 13.h, left: 10.w),
//               child: Container(),
//             ),
//             action: SizedBox(),
//           ),
//           body: GetBuilder<LawyerSearchContoller>(initState: (s) {

//           }, builder: (obj) {
//             return Stack(
//               children: [
//                 Container(
//                   height: height,
//                   width: width,
//                   child: Column(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           CustomHeaderWithTitle(
//                             title:
//                                 'Service Providers On-Demand Around Every Corner',
//                           ),

//                           //

//                           Center(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: 30.w, vertical: 30.h),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     "Welcome to Inkozi!",
//                                     style: CustomTextStyle.pc20bold,
//                                   ),
//                                   Padding(
//                                     padding:
//                                         EdgeInsets.symmetric(vertical: 10.h),
//                                     child: Text(
//                                       "Lawyers & Professionals On-Demand",
//                                       style: CustomTextStyle.ts17normal,
//                                     ),
//                                   ),

//                                   //
//                                   // LocationApproval(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       ////////////
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.bottomRight,
//                   child: Padding(
//                     padding: const EdgeInsets.all(30.0),
//                     child: Container(
//                       height: 70.h,
//                       width: 70.w,
//                       alignment: Alignment.centerRight,
//                       decoration: BoxDecoration(
//                           border: Border.all(color: primaryColor),
//                           color: primaryColor,
//                           shape: BoxShape.circle),
//                       child: Center(
//                         child: IconButton(
//                           icon: Icon(
//                             Icons.arrow_forward,
//                             color: Colors.white,
//                             size: 35.sp,
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(
//                                 context, '/lawyerbyspecialsearch');
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           }),
//           endDrawer: DrawerWidget(), //Drawer
//         ),
//       ),
//     );
//   }
// }

class CustomHeaderWithTitle extends StatelessWidget {
  const CustomHeaderWithTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HeaderClipper(),
      child: Container(
        height: 60.h,
        width: ScreenUtil().screenWidth,
        padding: EdgeInsets.only(left: 60.w, right: 60.w, bottom: 10.h),
        child: Center(
          child: Text(
            title,
            style: CustomTextStyle.pc15bold,
            textAlign: TextAlign.center,
          ),
        ),
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
          borderRadius: BorderRadius.circular(25),
          color: bgColor,
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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/icons/logowithbg.png'),
                    height: 50.h,
                    width: 50.w,
                    alignment: Alignment.center,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: Text(
                      "Allow Inkozi to access this device's Location?",
                      maxLines: 2,
                      style: CustomTextStyle.ts17normal,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnAllowDeny(
                    btnName: 'Deny',
                    onPress: () {
                      Navigator.pushNamed(context, '/login');
                      //Navigator.of(context).pop();
                    },
                    color: primaryColor,
                  ),
                  BtnAllowDeny(
                    btnName: 'Allow',
                    onPress: () {
                      Navigator.pushNamed(context, '/searchselection');
                    },
                    color: primaryColor,
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
