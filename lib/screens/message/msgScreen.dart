import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

import '../../widgets/widget.dart';

class MsgScreens extends StatefulWidget {
  const MsgScreens({super.key});

  static const String routeName = '/msgscreen';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MsgScreens(),
    );
  }

  @override
  State<MsgScreens> createState() => _MsgScreensState();
}

class _MsgScreensState extends State<MsgScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MsgAppBar(
        image: AssetImage('assets/images/mujahid.png'),
        name: 'Bert Seale',
        info: 'Active now',
      ),
      body: Column(
        children: [
          HeaderWithTitle(title: 'Communicate -> Text -> Call'),

          //

          SizedBox(
            height: 560,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ReceiveMsg(
                      msg: 'Hey Arthur, How are you?',
                    ),
                    SendMsg(
                      msg: "Good Morning Bert, I'm fine and you?",
                    ),
                    //
                    ReceiveMsg(
                      msg:
                          'As long as it is a payment system with money transaction, it is highly safe',
                    ),
                    SendMsg(
                      msg:
                          "I think you are quite right the trial method of credit cards is important",
                    ),
                    ReceiveMsg(
                      msg:
                          'As long as it is a payment system with money transaction, it is highly safe',
                    ),
                    SendMsg(
                      msg:
                          "I think you are quite right the trial method of credit cards is important",
                    ),
                    //
                    ReceiveMsg(
                      msg: 'ok',
                    ),
                  ],
                ),
              ),
            ),
          ),

          //
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25),
                    color: msgBgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage('assets/icons/attach.png'),
                              height: 20.h,
                              width: 20.w,
                              alignment: Alignment.center,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text(
                              'Type Message...',
                              textAlign: TextAlign.start,
                              style: CustomTextStyle.tpr15normal,
                            ),
                          ],
                        ),
                        Image(
                          image: AssetImage('assets/icons/smile.png'),
                          height: 20.h,
                          width: 20.w,
                          alignment: Alignment.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 50.w,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor),
                      color: primaryColor,
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35.sp,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/myprofile');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}

///////////// Receive Msg
class ReceiveMsg extends StatelessWidget {
  const ReceiveMsg({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15.0),
                  topLeft: Radius.circular(0.0),
                  bottomLeft: Radius.circular(15.0)),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.1,
                  0.7,
                ],
                colors: [primaryColor, primaryColor50],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                msg,
                textAlign: TextAlign.start,
                style: CustomTextStyle.bc15normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

///////////// Receive Msg
class SendMsg extends StatelessWidget {
  const SendMsg({
    super.key,
    required this.msg,
  });
  final String msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 200.w,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(0.0),
                    topLeft: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0)),
                color: msgBgColor),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                msg,
                textAlign: TextAlign.start,
                style: CustomTextStyle.tpr15normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
