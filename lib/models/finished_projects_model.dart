// To parse this JSON data, do
//
//     final finishedProjectModel = finishedProjectModelFromJson(jsonString);

import 'dart:convert';

FinishedProjectModel finishedProjectModelFromJson(String str) => FinishedProjectModel.fromJson(json.decode(str));

String finishedProjectModelToJson(FinishedProjectModel data) => json.encode(data.toJson());

class FinishedProjectModel {
  FinishedProjectModel({
    this.success,
    this.projects,
  });

  bool success;
  List<Project> projects;

  factory FinishedProjectModel.fromJson(Map<String, dynamic> json) => FinishedProjectModel(
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
    this.finishedDate,
  });

  int id;
  String name;
  String customer;
  DateTime deadline;
  double progress;
  int subLevelCount;
  int userCount;
  DateTime finishedDate;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    name: json["name"],
    customer: json["customer"],
    deadline: DateTime.parse(json["deadline"]),
    progress: json["progress"].toDouble(),
    subLevelCount: json["subLevelCount"],
    userCount: json["userCount"],
    finishedDate: DateTime.parse(json["finishedDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "customer": customer,
    "deadline": deadline.toIso8601String(),
    "progress": progress,
    "subLevelCount": subLevelCount,
    "userCount": userCount,
    "finishedDate": finishedDate.toIso8601String(),
  };
}
