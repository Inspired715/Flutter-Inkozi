// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

// import 'package:inkozi/UTILIS/text_style.dart';
// import '../../widgets/widget.dart';

// class VerifyOtpPage extends StatefulWidget {
//   const VerifyOtpPage({super.key});

//   static const String routeName = '/verifyotppage';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => VerifyOtpPage(),
//     );
//   }

//   @override
//   State<VerifyOtpPage> createState() => _VerifyOtpPageState();
// }

// class _VerifyOtpPageState extends State<VerifyOtpPage> {
//   OtpFieldController otpController = OtpFieldController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeaderWithTitle(
//               title: 'Verify Your Number',
//             ),
//             //
//             Padding(
//               padding: const EdgeInsets.all(25.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 20.h,
//                   ),
      
//                   Center(
//                     child: Text(
//                       "If it doesn't automatically enter the 4 digit code we just sent you to verify your account",
//                       style: CustomTextStyle.pc18normal,
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
                  
//                   //
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
//                     child: OTPTextField(
//                         controller: otpController,
//                         length: 4,
//                         width: MediaQuery.of(context).size.width / 2,
//                         textFieldAlignment: MainAxisAlignment.spaceBetween,
//                         fieldWidth: 30.w,
//                         fieldStyle: FieldStyle.underline,
//                         style: TextStyle(fontSize: 17),
//                         onChanged: (pin) {
//                           print("Changed: " + pin);
//                         },
//                         onCompleted: (pin) {
//                           print("Completed: " + pin);
//                         }),
//                   ),
                  
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Resend Code in 00:09',
//                         style: CustomTextStyle.pc17med,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
//                         child: Text(
//                           'Edit my mobile number',
//                           style: CustomTextStyle.ts12normal,
//                         ),
//                       ),
//                     ],
//                   ),
      
//                   ////////////
//                   Center(
//                     child: Column(
//                       children: [
//                         ButtonRectangle(
//                           btnName: 'Verify',
//                           onPress: () {
//                             Navigator.pushNamed(context, '/welcomes');
//                           },
//                         ),
//                          SizedBox(height: 60.h,),
//                 RoundedForwardBtn(
//                 width: 240.w,
//                 onTap: () {
//                   Navigator.pushNamed(context, '/welcomes');
//                 },
//               ),
//                       ],
//                     ),
//                   ),
      
//                   //
//                    SizedBox(
//             height: 70.h,
//           ),
//           Center(
//             child: Column(
//               children: [
//                 Text(
//                   'By Tipping to Continue I accept',
//                   textAlign: TextAlign.center,
//                   style: CustomTextStyle.ts12normal,
//                 ),
//                 Text(
//                   'Terms & Conditions - Privacy Policy',
//                   textAlign: TextAlign.center,
//                   style: CustomTextStyle.ts15normal,
//                 ),
//               ],
//             ),
//           ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
