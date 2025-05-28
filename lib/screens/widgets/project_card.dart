import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/circle_avatat_list.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_text.dart';
import 'circle_progress.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String dueIn;
  final List<String> avatarAssets;
  final String startDate;
  final String endDate;
  final double progress;

  const ProjectCard({
    super.key,
    required this.title,
    required this.dueIn,
    required this.avatarAssets,
    required this.startDate,
    required this.endDate,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: greyTextColor),
        borderRadius: BorderRadius.circular(10.06.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              BoldText(
                text: title,
                fontSize: 14.sp,
                fontWeight: FontWeight.w700,
              ),
              const Spacer(),
              Container(
                height: 16.h,
                width: 34.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: appColor,
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: CustomText(text: dueIn, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Team Members'),
                  SizedBox(height: 8.h),
                  SvgCircleAvatarList(
                    svgAssets: avatarAssets,
                    avatarRadius: 20,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: const Color.fromRGBO(255, 227, 222, 1),
                        radius: 10.r,
                        child: SvgPicture.asset('assets/svgs/uit_calender.svg'),
                      ),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'Start',
                            color: Colors.red,
                            fontSize: 8.sp,
                          ),
                          CustomText(text: startDate),
                        ],
                      ),
                      SizedBox(width: 12.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'End',
                            color: Colors.green,
                            fontSize: 8.sp,
                          ),
                          CustomText(text: endDate),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              CircularPercentIndicator(
                percent: progress,
                radius: 50,
                lineWidth: 6,
                progressColor: const Color.fromRGBO(89, 178, 0, 1),
                backgroundColor: Colors.grey.shade300,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
