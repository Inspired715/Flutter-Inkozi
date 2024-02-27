import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

import '../../widgets/widget.dart';

class MsgApproval extends StatefulWidget {
  const MsgApproval({super.key});

  static const String routeName = '/msgapproval';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MsgApproval(),
    );
  }

  @override
  State<MsgApproval> createState() => _MsgApprovalState();
}

class _MsgApprovalState extends State<MsgApproval> {
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
                  ],
                ),
              ),
            ),
          ),

          //
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnAllowDeny(
                    btnName: 'Deny',
                    onPress: () {
                      Navigator.pushNamed(context, '/searchselection');
                    },
                    color: btnBgColor,
                  ),
                  BtnAllowDeny(
                    btnName: 'Accept',
                    onPress: () {
                      Navigator.pushNamed(context, '/msgscreen');
                    },
                    color: btnBgColor,
                  ),
                ],
              )),
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
