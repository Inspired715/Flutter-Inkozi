import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';

class HeaderWithTitle extends StatelessWidget {
  const HeaderWithTitle({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CustomPaint(
            painter: HeaderClipper(),
            child: Container(
              width: 380.w,
              height: 54.h,
              // decoration: BoxDecoration(
              //   color: headerFillColor,
              // ),
              child: Center(
                child: Text(
                  title,
                  style: CustomTextStyle.pc15bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class HeaderClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();
    paint.style = PaintingStyle.fill;

    paint.color = Color(0xffF3E5F4);
    Paint borderPaint = Paint()
      ..color = primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.w;
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.55, 0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldClipper) => false;
}
