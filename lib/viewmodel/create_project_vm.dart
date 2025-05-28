import 'package:flutter/material.dart';

class CreateProjectViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  DateTime? startDate;
  DateTime? endDate;
  List<String> selectedStaffImages = [];
  List<String> selectedTags = [];

  List<String> tags = [];
  TextEditingController tagController = TextEditingController();
  final List<Map<String, String>> selectedStaff = [];

  void setStartDate(DateTime date) {
    startDate = date;
    notifyListeners();
  }

  void setEndDate(DateTime date) {
    endDate = date;
    notifyListeners();
  }

  void addStaff(Map<String, String> staff) {
    if (!selectedStaff.any((s) => s['name'] == staff['name'])) {
      selectedStaff.add(staff);
      notifyListeners();
    }
  }

  void removeStaff(Map<String, String> staff) {
    selectedStaff.removeWhere((s) => s['name'] == staff['name']);
    notifyListeners();
  }

  void addTag(String tag) {
    if (tag.isNotEmpty && tags.length < 5 && !tags.contains(tag)) {
      tags.add(tag);
      tagController.clear();
      notifyListeners();
    }
  }

  void removeTag(String tag) {
    tags.remove(tag);
    notifyListeners();
  }
}
