import 'package:do_it/utils/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoItLogo extends StatelessWidget {
  final double iconHeight;
  final double fontSize;
  final MainAxisAlignment alignment;

  const DoItLogo({
    super.key,
    this.iconHeight = 22,
    this.fontSize = 33,
    this.alignment = MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        SvgPicture.asset('assets/svgs/Group 7377.svg', height: iconHeight),
        SizedBox(width: 12.w),
        BoldText(
          text: 'DO',
          fontFamily: 'Mark Pro',
          fontSize: fontSize,
          color: Color.fromRGBO(33, 122, 192, 1),
          fontWeight: FontWeight.w700,
        ),
        BoldText(
          text: '-IT',
          fontFamily: 'Mark Pro',
          fontSize: fontSize,
          color: Color.fromRGBO(33, 122, 192, 1),
          fontWeight: FontWeight.w700,
          decoration: TextDecoration.underline,
        ),
      ],
    );
  }
}
