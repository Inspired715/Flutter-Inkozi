// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:http/http.dart';
// import 'package:inkozi/UTILIS/text_style.dart';
// import 'package:inkozi/widgets/ButtonWidget.dart';
// import 'package:inkozi/widgets/CustomAppBar.dart';
// import 'package:inkozi/widgets/custom_snackbar.dart';
// import 'package:inkozi/widgets/header.dart';
// import 'package:inkozi/widgets/textformfield.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';

// class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({super.key});

//   static String verify = ''; // This should be a class variable

//   static String verifiedPhone = ''; // Add this line

//   static const String routeName = '/phoneauth';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => PhoneAuth(),
//     );
//   }

//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }

// class _PhoneAuthState extends State<PhoneAuth> {
//   TextEditingController phoneController = TextEditingController();
//   var phone = '';
//   var completephone = '';

//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   countryController.text = "+880";
//   //   super.initState();
//   // }

//   //

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 HeaderWithTitle(
//                   title: 'Service Providers On-Demand Arounf Every Corner',
//                 ),
//                 //
//                 SizedBox(
//                   height: 30.h,
//                 ),

//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         "What's Your Number",
//                         style: CustomTextStyle.pc25bold,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: Text(
//                           "We'll text a code to verify your number",
//                           style: CustomTextStyle.ts13normal,
//                         ),
//                       ),
//                       Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 20),
//                           child: IntlPhoneField(
//                             controller: phoneController,
//                             flagsButtonPadding: const EdgeInsets.all(8),
//                             dropdownIconPosition: IconPosition.leading,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderSide: BorderSide(),
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(8.0)), // Add border radius
//                               ),
//                               hintText: '(xxx) xxx - xxxx',
//                               hintStyle: CustomTextStyle.ts20normal,
//                             ),
//                             initialCountryCode: 'US',
//                             onChanged: (p) {
//                               phone = p.number;
//                               completephone = p.completeNumber;
//                             },
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(bottom: 8),
//                         child: TextButton(
//                           onPressed: () {
//                             // Navigator.pushNamed(context, '/registration');
//                           },
//                           child: Text(
//                             "Create Your New Account",
//                             style: CustomTextStyle.pc20bold,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             ////////////
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image(
//                   image: AssetImage('assets/images/OR.png'),
//                   height: 30.h,
//                   width: 200.w,
//                   alignment: Alignment.center,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     Navigator.pushNamed(context, '/loginuser');
//                   },
//                   child: Text(
//                     "Log In",
//                     style: CustomTextStyle.ts13normal,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50.h,
//                 ),
//                 RoundedForwardBtn(
//                   width: 240.h,
//                   onTap: () async {
//                     try {
//                       await FirebaseAuth.instance.verifyPhoneNumber(
//                         phoneNumber: completephone,
//                         verificationCompleted:
//                             (PhoneAuthCredential credential) {},
//                         verificationFailed: (FirebaseAuthException e) {},
//                         codeSent: (String verificationId, int? resendToken) {
//                           PhoneAuth.verify = verificationId;
//                           PhoneAuth.verifiedPhone =
//                               phone; // Save the verified phone
//                           Navigator.pushNamed(context, '/otpinputpage');
//                         },
//                         codeAutoRetrievalTimeout: (String verificationId) {},
//                         timeout: Duration(seconds: 120),
//                       );
//                     } catch (e) {
//                       showCustomSnackBar("Verification failed", isError: true);
//                       print('Verification failed');
//                     }
//                   },
//                 ),
//               ],
//             ),

//             SizedBox(
//               height: 80.h,
//             ),
//             Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'By Tipping to Continue I accept',
//                     textAlign: TextAlign.center,
//                     style: CustomTextStyle.ts12normal,
//                   ),
//                   Text(
//                     'Terms & Conditions - Privacy Policy',
//                     textAlign: TextAlign.center,
//                     style: CustomTextStyle.ts15normal,
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// /////
// ///
