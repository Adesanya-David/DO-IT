import 'package:do_it/models/dashboard_list.dart';
import 'package:do_it/screens/widgets/dashboard_stats_card.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/app_constants.dart';
import 'package:do_it/utils/custom_appbar.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../models/project_list.dart';
import '../utils/page_wrapper.dart';
import 'widgets/project_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: CustomWidgetAppBar(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                    text: 'Hi Dexter',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Mark Pro',
                  ),
                  SizedBox(height: 1.h),
                  CustomText(
                    text: 'Welcome onboard',
                    fontFamily: 'Mark Pro',
                    color: appColor,
                  ),

                  // const Spacer(),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  ToastHelper.showToast(unavailable);
                },
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(236, 241, 255, 1),
                  child: SvgPicture.asset('assets/svgs/notification-bing.svg'),
                ),
              ),
            ],
          ),
        ),
      ),

      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dashboardStats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 20.w,
                childAspectRatio: 156 / 128,
              ),
              itemBuilder: (context, index) {
                final stat = dashboardStats[index];
                return DashboardStatCard(
                  svgAsset: stat['svgAsset'],
                  number: stat['number'],
                  label: stat['label'],
                  backgroundColor: stat['backgroundColor'],
                  avatarColor: stat['avatarColor'],
                  svgColor: stat['svgColor'],
                );
              },
            ),
            SizedBox(height: 44.h),
            Row(
              children: [
                BoldText(
                  text: 'Task in Progress',
                  fontSize: 16.spMax,
                  fontWeight: FontWeight.w500,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: BoldText(
                    text: 'See all',
                    fontSize: 16.spMax,
                    fontWeight: FontWeight.w500,
                    color: appColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: projectData.length,
              separatorBuilder: (_, __) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final data = projectData[index];
                return ProjectCard(
                  title: data['title'],
                  dueIn: data['dueIn'],
                  avatarAssets: List<String>.from(data['avatars']),
                  startDate: data['startDate'],
                  endDate: data['endDate'],
                  progress: data['progress'],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
