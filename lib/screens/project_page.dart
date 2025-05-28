import 'package:do_it/screens/add_project_page.dart';
import 'package:do_it/screens/add_task_page.dart';
import 'package:do_it/utils/app_colors.dart';
import 'package:do_it/utils/custom_appbar.dart';
import 'package:do_it/utils/custom_text.dart';
import 'package:do_it/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/task_list.dart';
import '../utils/page_wrapper.dart';
import 'widgets/task_card.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      appBar: CustomWidgetAppBar(
        content: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BoldText(text: 'Projects', fontSize: 24.sp),
              const Spacer(),
              InkWell(
                onTap: () {
                  navigateToPage(context, AddProjectPage());
                },
                child: Container(
                  height: 24.h,
                  width: 98.29.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: appColor),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: CustomText(text: 'Create Project', color: appColor),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: List.generate(taskCardList.length, (index) {
                final task = taskCardList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: TaskCard(
                    title: task['title'],
                    imageAsset: task['imageAsset'],
                    daysLeft: task['daysLeft'],
                    startDate: task['startDate'],
                    endDate: task['endDate'],
                    onAddTask: () {
                      navigateToPage(context, AddTaskPage());
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
