// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'app_colors.dart';
import 'custom_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final double borderRadius;
  final BorderSide? borderSide;
  final double? fontSize;
  final FontWeight fontWeight;
  final double height;
  final double width;
  final Color labelColor;
  final Function()? onPressed;
  final Function()? onLongPress;
  final bool isTrailingIconVisible;
  final IconData? trailingIcon;
  final Alignment alignment;
  final Widget? customTextButton;
  final Color? buttonColor;
  final Widget? image;

  const CustomButton({
    super.key,
    required this.label,
    this.backgroundColor = appColor,
    this.labelColor = Colors.white,
    this.onPressed,
    this.onLongPress,
    this.borderRadius = 10,
    this.borderSide,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w500,
    this.height = 40,
    this.width = 0.8,
    this.isTrailingIconVisible = false,
    this.trailingIcon,
    this.alignment = Alignment.center,
    this.customTextButton,
    this.buttonColor,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.blue,
        ),
        child: CustomText(
          text: label,
          color: labelColor,
          fontSize: fontSize!.sp,
          fontFamily: ' Mark Pro',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Color color;
  final double size;
  final VoidCallback? onTap;

  const CustomBackButton({
    super.key,
    this.color = Colors.black,
    this.size = 25.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap ?? () => Navigator.of(context).pop(),
        child: CircleAvatar(
          child: SvgPicture.asset('assetName', color: Colors.white),
        ),
      ),
    );
  }
}
