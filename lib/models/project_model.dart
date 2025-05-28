class ProjectModel {
  String name;
  DateTime startDate;
  DateTime endDate;
  List<String> staffImages;
  List<String> tags;
  String description;

  ProjectModel({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.staffImages,
    required this.tags,
    required this.description,
  });
}
