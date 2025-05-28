// ignore_for_file: deprecated_member_use

import 'package:do_it/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_text.dart';

class DashboardStatCard extends StatelessWidget {
  final String svgAsset;
  final String number;
  final String label;
  final Color? backgroundColor;
  final Color? avatarColor;
  final Color? svgColor;

  const DashboardStatCard({
    super.key,
    required this.svgAsset,
    required this.number,
    required this.label,
    this.backgroundColor,
    this.avatarColor,
    this.svgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.h,
      // width: 156.w,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: avatarColor ?? Colors.white,
                child: SvgPicture.asset(
                  svgAsset,
                  height: 20,
                  width: 20,
                  color: svgColor ?? appColor,
                ),
              ),
              const Spacer(),
              BoldText(
                text: number,
                fontFamily: 'Mark Pro',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          const Spacer(),
          CustomText(text: label, fontFamily: 'Mark Pro'),
        ],
      ),
    );
  }
}
