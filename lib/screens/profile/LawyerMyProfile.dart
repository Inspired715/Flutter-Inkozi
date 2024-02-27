import 'package:flutter/material.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import '../../widgets/widget.dart';

class LawyerMyProfile extends StatefulWidget {
  const LawyerMyProfile({super.key});

  static const String routeName = '/lawyermyprofile';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LawyerMyProfile(),
    );
  }

  @override
  State<LawyerMyProfile> createState() => _LawyerMyProfileState();
}

class _LawyerMyProfileState extends State<LawyerMyProfile> {
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
                      '${StaticValues.lawyerInfo!.firstName ?? ""} ${StaticValues.lawyerInfo!.lastName ?? ""}',
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
                  info: StaticValues.lawyerInfo!.phone ?? '(407) 8006404',
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
                  image: AssetImage('assets/icons/lawcategory.png'),
                  name: 'Law Category',
                  info: 'Your category goes here',
                ),
                ProfileInfoList(
                  image: AssetImage('assets/icons/rating.png'),
                  name: 'Rating',
                  info: '***** 4.5',
                ),
                ProfileInfoList(
                  image: AssetImage('assets/icons/accountstatus.png'),
                  name: 'Account Status',
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
