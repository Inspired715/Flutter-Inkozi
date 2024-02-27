// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:inkozi/UTILIS/text_style.dart';
// import 'package:inkozi/screens/USER/AUTH/PhoneAuth.dart';
// import 'package:inkozi/screens/USER/AUTH/REGISTER/V/RegistrationPage.dart';
// import 'package:inkozi/widgets/ButtonWidget.dart';
// import 'package:inkozi/widgets/CustomAppBar.dart';
// import 'package:inkozi/widgets/custom_snackbar.dart';
// import 'package:inkozi/widgets/header.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';

// class OtpInputPage extends StatefulWidget {
//   const OtpInputPage({super.key});

//   static const String routeName = '/otpinputpage';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => OtpInputPage(),
//     );
//   }

//   @override
//   State<OtpInputPage> createState() => _OtpInputPageState();
// }

// class _OtpInputPageState extends State<OtpInputPage> {
//   OtpFieldController otpController = OtpFieldController();
//   //
//   FirebaseAuth auth = FirebaseAuth.instance;
//   var code = '';
//   //
//   Future<void> registerUser() async {
//     try {
//       final response = await http.post(
//         Uri.parse('https://inkozi.com/api/01/user_registration'),
//         headers: {
//           'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100',
//         },
//         body: {
//           'phone': PhoneAuth.verify, // Assuming 'verify' is the OTP
//           // Add other required parameters for user registration
//         },
//       );

//       if (response.statusCode == 200) {
//         // Registration successful, handle the response here
//         // You can navigate to the 'ConsumersThanks' screen or perform any other action
//         Navigator.pushNamed(context, '/consumersthanks');
//       } else {
//         // Registration failed, show a Snackbar with an error message
//         final snackBar = SnackBar(
//           content:
//               Text('Registration failed. Status Code: ${response.statusCode}'),
//           duration:
//               Duration(seconds: 3), // You can adjust the duration as needed
//         );
//         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//       }
//     } catch (e) {
//       // Handle network errors or other exceptions
//       print('Error: $e');
//       // Show a Snackbar with a generic error message
//       final snackBar = SnackBar(
//         content: Text('Registration failed. Please try again later.'),
//         duration: Duration(seconds: 3), // You can adjust the duration as needed
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }
//   //

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BackAppBarWithMainLogo(),
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HeaderWithTitle(
//               title: '',
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

//                   Text(
//                     "Enter the code",
//                     style: CustomTextStyle.pc17med,
//                   ),
//                   Text(
//                     "sent to your phone !!!",
//                     style: CustomTextStyle.pc17med,
//                   ),
//                   //
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(0, 10, 0, 100),
//                     child: OTPTextField(
//                       //controller: otpController,
//                       length: 6,
//                       width: MediaQuery.of(context).size.width,
//                       textFieldAlignment: MainAxisAlignment.spaceEvenly,
//                       fieldWidth: 30.w,
//                       fieldStyle: FieldStyle.underline,
//                       style: TextStyle(fontSize: 17),
//                       onChanged: (pin) {
//                         // Update the code variable when OTP is entered
//                         setState(() {
//                           code = pin;
//                         });
//                       },
//                       onCompleted: (pin) {
//                         print("Completed: " + pin);
//                       },
//                       // onChanged: (pin) {
//                       //   // print("Changed: " + pin);
//                       //   code = pin;
//                       // },
//                       // onCompleted: (pin) {
//                       //   print("Completed: " + pin);
//                       // },
//                     ),
//                   ),

//                   ////////////
//                   Center(
//                     child: Column(
//                       children: [
//                         ButtonRectangle(
//                           btnName: 'Start Now',
//                           onPress: () async {
//                             // BlocProvider.of<AuthBloc>(context).add(AuthLoggedIn(user));
//                             try {
//                               // Create a PhoneAuthCredential with the code
//                               PhoneAuthCredential credential =
//                                   PhoneAuthProvider.credential(
//                                       verificationId: PhoneAuth.verify,
//                                       smsCode:
//                                           code); // vrify fron phone page and code from upper veriable

//                               // Sign the user in (or link) with the credential
//                               await auth.signInWithCredential(credential);
//                               showCustomSnackBar("Success", isError: false);
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => UserRegistrationPage(
//                                       verifiedPhone: PhoneAuth.verifiedPhone),
//                                 ),
//                               );
//                             } catch (e) {
//                               showCustomSnackBar("Wrong Pin", isError: true);
//                               print('Wrong Pin');
//                             }
//                             //Navigator.pushNamed(context, '/consumersthanks');
//                           },
//                         ),
//                         SizedBox(
//                           height: 100.h,
//                         ),
//                         //   RoundedForwardBtn(
//                         //   width: 240.w,
//                         //   onTap: () {
//                         //     Navigator.pushNamed(context, '/consumersthanks');
//                         //   },
//                         // ),
//                       ],
//                     ),
//                   ),

//                   //
//                   SizedBox(
//                     height: 50.h,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Resend Code in 00:45',
//                         style: CustomTextStyle.pc17med,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 10),
//                         child: InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/registration');
//                           },
//                           child: Text(
//                             'Edit my mobile number',
//                             style: CustomTextStyle.ts12normal,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
