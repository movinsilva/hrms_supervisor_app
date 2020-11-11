// To parse this JSON data, do
//
//     final currentProjectsModel = currentProjectsModelFromJson(jsonString);

import 'dart:convert';

CurrentProjectsModel currentProjectsModelFromJson(String str) => CurrentProjectsModel.fromJson(json.decode(str));

String currentProjectsModelToJson(CurrentProjectsModel data) => json.encode(data.toJson());

class CurrentProjectsModel {
  CurrentProjectsModel({
    this.success,
    this.projects,
  });

  bool success;
  List<Project> projects;

  factory CurrentProjectsModel.fromJson(Map<String, dynamic> json) => CurrentProjectsModel(
    success: json["success"],
    projects: List<Project>.from(json["projects"].map((x) => Project.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
  };
}

class Project {
  Project({
    this.id,
    this.name,
    this.customer,
    this.deadline,
    this.progress,
    this.subLevelCount,
    this.userCount,
  });

  int id;
  String name;
  String customer;
  DateTime deadline;
  double progress;
  int subLevelCount;
  int userCount;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    name: json["name"],
    customer: json["customer"],
    deadline: DateTime.parse(json["deadline"]),
    progress: double.parse(json["progress"].toString()),
    subLevelCount: json["subLevelCount"],
    userCount: json["userCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "customer": customer,
    "deadline": deadline.toIso8601String(),
    "progress": progress,
    "subLevelCount": subLevelCount,
    "userCount": userCount,
  };
}
