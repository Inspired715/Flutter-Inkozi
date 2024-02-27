import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:inkozi/UTILIS/text_style.dart';
import '../../widgets/widget.dart';

class ProvidersThanks extends StatefulWidget {
  const ProvidersThanks({super.key});

  static const String routeName = '/providersthanks';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProvidersThanks(),
    );
  }

  @override
  State<ProvidersThanks> createState() => _ProvidersThanksState();
}

class _ProvidersThanksState extends State<ProvidersThanks> {
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
                title: 'Providers only',
              ),

              //

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: Image(
                        image: AssetImage('assets/icons/register.png'),
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                      ),
                    ),
                    Text(
                      "Thank you for registering with InKozi",
                      style: CustomTextStyle.pc20bold,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Column(
                        children: [
                          Text(
                            "Your profile is pending review.",
                            style: CustomTextStyle.pc20bold,
                          ),
                          Text(
                            "InKozi will notify you shortly",
                            style: CustomTextStyle.pc20bold,
                            textAlign: TextAlign.center,
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
          SizedBox(
            height: 50.h,
          ),
          Transform.translate(
            offset: const Offset(70, 0),
            child: ButtonRectangle(
              btnName: 'Go to login',
              onPress: () {
                Navigator.pushNamed(context, '/consumersthanks');
              },
            ),
          ),
        ],
      ),
    );
  }
}
