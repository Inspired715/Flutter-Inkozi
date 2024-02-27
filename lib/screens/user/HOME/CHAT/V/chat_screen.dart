// import 'package:inkozi/screens/USER/HOME/CHAT/M/MessageModel.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:grouped_list/grouped_list.dart';
// import 'package:inkozi/UTILIS/colors.dart';
// import 'package:inkozi/UTILIS/text_style.dart';
// import 'package:inkozi/widgets/CustomAppBar.dart';

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key, required this.title});
//   final String title;

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   TextEditingController messageController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: Padding(
//           padding: EdgeInsets.only(left: 50.w),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 maxRadius: 22,
//                 backgroundImage: AssetImage('assets/icons/chat_profile.png'),
//               ),
//               SizedBox(
//                 width: 10.w,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: CustomTextStyle.bc18med,
//                   ),
//                   Text(
//                     'Online',
//                     style: CustomTextStyle.bc14med,
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(
//             'assets/icons/chat_bg.png',
//             height: 240.h,
//           ),
//           Column(children: [
//             Expanded(
//               child: GroupedListView<MessageModel, DateTime>(
//                 reverse: true,
//                 order: GroupedListOrder.DESC,
//                 floatingHeader: true,
//                 padding: EdgeInsets.all(15),
//                 elements: messages,
//                 groupBy: (message) => DateTime(
//                   message.dateTime.year,
//                   message.dateTime.month,
//                   message.dateTime.day,
//                 ),
//                 groupHeaderBuilder: (MessageModel message) => Center(
//                   child: Container(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       color: primaryColor,
//                     ),
//                     child: Text(
//                       message.dateTime.day == DateTime.now().day
//                           ? 'Today'
//                           : DateFormat.yMMMd().format(message.dateTime),
//                       style: CustomTextStyle.bc14med,
//                     ),
//                   ),
//                 ),
//                 itemBuilder: (context, MessageModel message) => Align(
//                   alignment: message.isSentByme
//                       ? Alignment.centerRight
//                       : Alignment.centerLeft,
//                   child: Container(
//                     padding: EdgeInsets.fromLTRB(
//                         message.isSentByme ? 30.w : 20.w, 20.h, 40.w, 20.w),
//                     margin: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: primaryColor, width: 1.w),
//                       color: Color(0xffF3E5F4),
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30.r),
//                           topRight: Radius.circular(30.r),
//                           bottomRight:
//                               Radius.circular(message.isSentByme ? 0 : 30.r),
//                           bottomLeft:
//                               Radius.circular(message.isSentByme ? 30.r : 0)),
//                     ),
//                     child: Text(
//                       message.text,
//                       style: CustomTextStyle.pc16bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               height: 50.h,
//               width: ScreenUtil().screenWidth,
//               padding: EdgeInsets.fromLTRB(30.w, 0, 15.w, 10.h),
//               margin: EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Color(0xffF3E5F4),
//                 borderRadius: BorderRadius.circular(32.r),
//                 border: Border.all(color: primaryColor, width: 1.w),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       controller: messageController,
//                       onFieldSubmitted: (value) {
//                         if (value.isNotEmpty) {
//                           final message = MessageModel(
//                               text: messageController.text,
//                               dateTime: DateTime.now(),
//                               isSentByme: true);
//                           setState(() {
//                             messages.add(message);
//                             messageController.clear();
//                           });
//                         }
//                       },
//                       style: TextStyle(
//                         fontSize: 16.sp,
//                         color: primaryColor,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       cursorColor: primaryColor,
//                       decoration: InputDecoration(
//                         border: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: primaryColor,
//                             width: 1.w,
//                           ),
//                         ),
//                         enabledBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: primaryColor,
//                             width: 1.w,
//                           ),
//                         ),
//                         focusedBorder: UnderlineInputBorder(
//                           borderSide: BorderSide(
//                             color: primaryColor,
//                             width: 1.w,
//                           ),
//                         ),
//                         hintText: 'Type your message here',
//                         hintStyle: TextStyle(
//                           fontSize: 14.sp,
//                           color: Color(0xff857B7B),
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 30.w,
//                     padding: EdgeInsets.only(top: 5.h),
//                     decoration: BoxDecoration(
//                       border: Border(
//                         bottom: BorderSide(color: primaryColor, width: 1.w),
//                       ),
//                     ),
//                     child: Center(
//                       child: Image.asset(
//                         'assets/icons/emoji.png',
//                         height: 18.h,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 5.h),
//                     child: Row(
//                       children: [
//                         SizedBox(
//                           width: 5.w,
//                         ),
//                         GestureDetector(
//                           onTap: () {},
//                           child: Container(
//                             height: 30.h,
//                             width: 40.w,
//                             color: Colors.transparent,
//                             child: Center(
//                               child: Image.asset(
//                                 'assets/icons/link.png',
//                                 height: 18.h,
//                               ),
//                             ),
//                           ),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             if (messageController.text.isNotEmpty) {
//                               final message = MessageModel(
//                                   text: messageController.text,
//                                   dateTime: DateTime.now(),
//                                   isSentByme: true);
//                               setState(() {
//                                 messages.add(message);
//                                 messageController.clear();
//                               });
//                             }
//                           },
//                           child: Container(
//                             height: 30.h,
//                             width: 40.w,
//                             color: Colors.transparent,
//                             child: Center(
//                               child: Image.asset(
//                                 'assets/icons/send.png',
//                                 height: 18.h,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ]),
//         ],
//       ),
//       resizeToAvoidBottomInset: false,
//     );
//   }
// }
