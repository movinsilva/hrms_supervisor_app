// To parse this JSON data, do
//
//     final newProjectModel = newProjectModelFromJson(jsonString);

import 'dart:convert';

NewProjectModel newProjectModelFromJson(String str) => NewProjectModel.fromJson(json.decode(str));

String newProjectModelToJson(NewProjectModel data) => json.encode(data.toJson());

class NewProjectModel {
  NewProjectModel({
    this.success,
    this.upcomingProjects,
    this.message,
  });

  bool success;
  List<UpcomingProject> upcomingProjects;
  String message;

  factory NewProjectModel.fromJson(Map<String, dynamic> json) => NewProjectModel(
    success: json["success"],
    upcomingProjects: List<UpcomingProject>.from(json["upcomingProjects"].map((x) => UpcomingProject.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "upcomingProjects": List<dynamic>.from(upcomingProjects.map((x) => x.toJson())),
    "message": message,
  };
}

class UpcomingProject {
  UpcomingProject({
    this.id,
    this.userId,
    this.deadline,
    this.remark,
    this.name,
  });

  int id;
  String userId;
  DateTime deadline;
  String remark;
  String name;

  factory UpcomingProject.fromJson(Map<String, dynamic> json) => UpcomingProject(
    id: json["id"],
    userId: json["userID"],
    deadline: DateTime.parse(json["deadline"]),
    remark: json["remark"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userID": userId,
    "deadline": deadline.toIso8601String(),
    "remark": remark,
    "name": name,
  };
}