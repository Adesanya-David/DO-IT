import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final Color? color;
  final double letterSpacing;
  final int? maxLines;
  final TextOverflow textOverflow;
  final String? fontFamily;

  const CustomText({
    super.key,
    required this.text,
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing = .01,
    this.maxLines,
    this.fontFamily,
    this.textOverflow = TextOverflow.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        decoration: decoration,
        color: color,
        letterSpacing: letterSpacing,
        fontFamily: fontFamily ?? 'Mark Pro',
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}

class BoldText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration decoration;
  final Color? color;
  final double letterSpacing;
  final int? maxLines;
  final String? fontFamily;
  final TextOverflow textOverflow;
  final Color? decorationColor;
  final double? height;

  const BoldText({
    super.key,
    required this.text,
    this.fontSize = 40,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.decoration = TextDecoration.none,
    this.color,
    this.letterSpacing = .01,
    this.maxLines,
    this.fontFamily,
    this.textOverflow = TextOverflow.visible,
    this.decorationColor,
    this.height = 1.1,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;

    final textColor =
        brightness == Brightness.light ? const Color(0xff0D001E) : Colors.white;

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: fontWeight,
        fontFamily: fontFamily ?? 'Mark Pro',
        color: color ?? textColor,
        letterSpacing: letterSpacing,
        decoration: decoration,
        decorationColor: decorationColor ?? (color ?? textColor),
        height: height,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: textOverflow,
    );
  }
}
