import 'package:do_it/screens/add_task_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/project_list.dart';
import '../utils/app_colors.dart';
import '../utils/custom_appbar.dart';
import '../utils/custom_text.dart';
import '../utils/page_wrapper.dart';
import '../utils/router.dart';
import 'widgets/project_card.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: CustomWidgetAppBar(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              BoldText(text: 'Tasks', fontSize: 24.sp),
              const Spacer(),
              InkWell(
                onTap: () {
                  navigateToPage(context, AddTaskPage());
                },
                child: Container(
                  height: 24.h,
                  width: 98.29.w,
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
        ),
      ),
      child: SingleChildScrollView(
        child: ListView.separated(
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
      ),
    );
  }
}
