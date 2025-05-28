import 'package:do_it/utils/custom_appbar.dart';
import 'package:do_it/utils/page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../models/staff_avatar_list.dart';
import '../utils/app_colors.dart';
import '../utils/custom_bordered_textformfield.dart';
import '../utils/custom_button.dart';
import '../utils/custom_text.dart';
import '../viewmodel/create_project_vm.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateProjectViewModel(),
      child: PageWrapper(
        appBar: CustomAppBar(text: ''),
        child: Consumer<CreateProjectViewModel>(
          builder: (context, viewModel, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BoldText(
                    text: 'Add Task',
                    fontWeight: FontWeight.w500,
                    fontSize: 24.sp,
                  ),
                  SizedBox(height: 22.h),
                  TextField(
                    controller: viewModel.nameController,
                    decoration: const InputDecoration(labelText: 'Task Name'),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) viewModel.setStartDate(date);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'Created (from)',
                            ),
                            child: Text(
                              viewModel.startDate?.toLocal().toString().split(
                                    ' ',
                                  )[0] ??
                                  'Select Date',
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () async {
                            final date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2100),
                            );
                            if (date != null) viewModel.setEndDate(date);
                          },
                          child: InputDecorator(
                            decoration: const InputDecoration(
                              labelText: 'End (to)',
                            ),
                            child: Text(
                              viewModel.endDate?.toLocal().toString().split(
                                    ' ',
                                  )[0] ??
                                  'Select Date',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  const Text("Assign Task:"),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: StaffAvatarList(
                          staffList: viewModel.selectedStaff,
                          onRemove: viewModel.removeStaff,
                        ),
                      ),
                      IconButton(
                        onPressed:
                            () => _showStaffSelectionBottomSheet(
                              context,
                              viewModel,
                            ),
                        icon: const Icon(Icons.add_circle, color: appColor),
                        tooltip: "Add Staff",
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text("Tags:"),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 8,
                    children:
                        viewModel.tags.map((tag) {
                          return InputChip(
                            label: Text(tag),
                            onDeleted: () => viewModel.removeTag(tag),
                            deleteIconColor: Colors.redAccent,
                          );
                        }).toList(),
                  ),
                  Visibility(
                    visible: viewModel.tags.length < 5,
                    child: CustomBorderedTextFormField(
                      title: '',
                      hintText:
                          viewModel.tags.length >= 5
                              ? 'Maximum of 5 tags added'
                              : 'Enter tag and press Enter',
                      controller: viewModel.tagController,
                      onSubmitted: viewModel.addTag,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Description"),
                  SizedBox(height: 7.h),
                  CustomBorderedTextFormField(
                    title: '',
                    maxLines: 4,
                    maxLength: 100,
                    controller: viewModel.descriptionController,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(label: 'Add Task', onPressed: () {}),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showStaffSelectionBottomSheet(
    BuildContext context,
    CreateProjectViewModel viewModel,
  ) {
    final availableStaff = [
      {"name": "Alice", "image": "assets/images/Ellipse 133.png"},
      {"name": "Bob", "image": "assets/images/Ellipse 132.png"},
      {"name": "Charlie", "image": "assets/images/Ellipse 132.png"},
      {"name": "Daisy", "image": "assets/images/Ellipse 550.png"},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        final screenHeight = MediaQuery.of(context).size.height;
        return SizedBox(
          height: screenHeight * 0.35,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Staff",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 0.8,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                    itemCount: availableStaff.length,
                    itemBuilder: (_, index) {
                      final staff = availableStaff[index];
                      return GestureDetector(
                        onTap: () {
                          viewModel.addStaff(staff);
                          Navigator.pop(context);
                        },
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(staff['image']!),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              staff['name']!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
