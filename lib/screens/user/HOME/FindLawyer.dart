import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/widget.dart';

class FindLawyer extends StatefulWidget {
  const FindLawyer({super.key});

  static const String routeName = '/findlawer';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => FindLawyer(),
    );
  }

  @override
  State<FindLawyer> createState() => _FindLawyerState();
}

class _FindLawyerState extends State<FindLawyer> {
  TextEditingController categoriesController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWithTitle(
                  title: 'Find Your Lawer',
                ),

                //

                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      searchInput(
                        hintText: 'Category',
                        controller: categoriesController,
                      ),
                      searchInput(
                        hintText: ' State',
                        controller: stateController,
                      ),
                      searchInput(
                        hintText: ' City',
                        controller: cityController,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ////////////
            SizedBox(
              height: 200.h,
            ),
            RoundedForwardBtn(
              width: 250.w,
              onTap: () {
                Navigator.pushNamed(context, '/msgscreen');
              },
            )
          ],
        ),
      ),
      drawer: DrawerWidget(),
    );
  }
}
