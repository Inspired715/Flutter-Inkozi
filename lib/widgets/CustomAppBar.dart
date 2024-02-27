import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

////////// Deafault App Bar
///
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.action,
    this.imageUrl,
    this.title,
  });
  final Widget? leading;
  final Widget? action;
  final String? imageUrl;
  final Widget? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 108.h,
      width: ScreenUtil().screenWidth,
      color: primaryColor,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/icons/mask_left.png'),
              Image.asset('assets/icons/mask_right.png'),
            ],
          ),
          leading ??
              Positioned(
                left: 5.w,
                top: 20.h,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 30.h,
                    width: 40.w,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.arrow_back,
                      color: bgColor,
                      size: 20.h,
                    ),
                  ),
                ),
              ),
          Center(
            child: title ??
                Image.asset(
                  'assets/icons/minilogo.png',
                  height: 45.h,
                ),
          ),
          Positioned(
            top: 20.h,
            right: 5.w,
            child: action ??
                InkWell(
                  onTap: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: Container(
                    height: 30.h,
                    width: 40.w,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.menu,
                      color: bgColor,
                      size: 20.h,
                    ),
                  ),
                ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.0.h);
}

/////////// BackAppBarWithSearch

class BackAppBarWithMainLogo extends StatelessWidget
    implements PreferredSizeWidget {
  const BackAppBarWithMainLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      elevation: 0,
      title: Image(
        image: AssetImage('assets/icons/mainlogo.png'),
        height: 50.h,
        width: 100.w,
        alignment: Alignment.center,
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}

/////////// BackAppBarWithTitle

class BackAppBarWithTitle extends StatelessWidget
    implements PreferredSizeWidget {
  const BackAppBarWithTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}

/////////// MsgAppBar

class MsgAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MsgAppBar({
    super.key,
    required this.image,
    required this.name,
    required this.info,
  });
  final AssetImage image;
  final String name, info;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 22.r,
              backgroundImage: image,
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: CustomTextStyle.bc18bold,
                ),
                Text(
                  info,
                  style: CustomTextStyle.bc12normal,
                ),
              ],
            ),
          ],
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);
}
