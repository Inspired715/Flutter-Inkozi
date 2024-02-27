import 'package:flutter/material.dart';
import 'package:inkozi/UTILIS/colors.dart';

import '../../../../../widgets/widget.dart';
import 'package:inkozi/constrains/app_constrains.dart';

class MyProfile extends StatefulWidget {
  MyProfile({super.key});

  static const String routeName = '/myprofile';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => MyProfile(),
    );
  }

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          action: SizedBox(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWithTitle(
              title: 'Profile',
            ),

            //

            Column(
              children: [
                ProfileImgName(
                  image: AssetImage('assets/images/mujahid.png'),
                  name:
                      '${StaticValues.userInfo!.firstName ?? ""} ${StaticValues.userInfo!.lastName ?? ""}',
                  info: '',
                ),

                //
                Divider(
                  color: inputTextColor,
                  height: 2,
                ),
                //
                SizedBox(height: 10),
                ProfileInfoList(
                  image: AssetImage('assets/icons/phone.png'),
                  name: 'Phone',
                  info: StaticValues.userInfo!.phone ?? '(407) 8006404',
                ),
                ProfileInfoList(
                  image: AssetImage('assets/icons/email.png'),
                  name: 'Email',
                  info: StaticValues.userInfo!.email ?? 'contact@inkozi.com',
                ),
                // ProfileInfoList(
                //   image: AssetImage('assets/icons/address.png'),
                //   name: 'Address',
                //   info: '29 stone Ridge Rd',
                // ),
                // ProfileInfoList(
                //   image: AssetImage('assets/icons/city.png'),
                //   name: 'City',
                //   info: 'Brewster',
                // ),
                // ProfileInfoList(
                //   image: AssetImage('assets/icons/state.png'),
                //   name: 'State',
                //   info: 'NY',
                // ),
                // ProfileInfoList(
                //   image: AssetImage('assets/icons/zip.png'),
                //   name: 'Zip',
                //   info: '10509',
                // ),
                ProfileInfoList(
                  image: AssetImage('assets/icons/verifiedstatus.png'),
                  name: 'Verified Status',
                  info: 'Verified',
                ),
              ],
            ),
          ],
        ),
        drawer: DrawerWidget(),
      ),
    );
  }
}
