import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/custom_text.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String daysLeft;
  final String startDate;
  final String endDate;
  final VoidCallback? onAddTask;

  const TaskCard({
    super.key,
    required this.title,
    required this.imageAsset,
    required this.daysLeft,
    required this.startDate,
    required this.endDate,
    this.onAddTask,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 103.h,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: appColor),
        borderRadius: BorderRadius.circular(10.06.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 24.r,
                backgroundColor: Colors.white24,
                child: Image.asset(imageAsset, fit: BoxFit.contain),
              ),
              SizedBox(width: 8.w),
              CustomText(text: title),
              const Spacer(),
              Container(
                height: 16.h,
                width: 33.29.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 154, 73, 1),
                  borderRadius: BorderRadius.circular(2.r),
                ),
                child: CustomText(
                  text: daysLeft,
                  color: Colors.white,
                  fontSize: 10.sp,
                ),
              ),
            ],
          ),

          /// Bottom Row
          SizedBox(height: 8.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Start', color: Colors.red, fontSize: 8.sp),
                  CustomText(text: startDate),
                ],
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'End', color: Colors.green, fontSize: 8.sp),
                  CustomText(text: endDate),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: onAddTask,
                child: Container(
                  height: 21.h,
                  width: 65.29.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: CustomText(text: 'Add Task', color: appColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
