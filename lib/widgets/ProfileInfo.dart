import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/text_style.dart';

class ProfileImgName extends StatelessWidget {
  ProfileImgName({
    super.key,
    required this.image,
    required this.name,
    required this.info,
  });

  final AssetImage image;
  final String? name, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/addphoto');
            },
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.transparent,
              // backgroundImage: image,
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name!,
                style: CustomTextStyle.tpr18bold,
              ),
              Text(
                info!,
                style: CustomTextStyle.ts12normal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Profile Info List

class ProfileInfoList extends StatelessWidget {
  ProfileInfoList({
    super.key,
    required this.image,
    required this.name,
    required this.info,
  });

  final AssetImage image;
  final String name, info;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Image(
                image: image,
                height: 18.h,
                width: 18.w,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 18.h,
              ),
            ],
          ),
          SizedBox(
            width: 20.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: CustomTextStyle.pc12normal,
              ),
              Text(
                info,
                style: CustomTextStyle.tpr18bold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
