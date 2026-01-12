class ProjectsModel {
  final String banner;
  final String title;
  final String description;

  ProjectsModel({
    required this.banner,
    required this.title,
    required this.description,
  });

  factory ProjectsModel.fromJson(Map<String, dynamic> json) {
    return ProjectsModel(
      banner: json['banner'],
      title: json['title'],
      description: json['description'],
    );
  }
}
