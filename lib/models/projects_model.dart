// To parse this JSON data, do
//
//     final projectsModel = projectsModelFromJson(jsonString);

import 'dart:convert';

ProjectsModel projectsModelFromJson(String str) => ProjectsModel.fromJson(json.decode(str));

String projectsModelToJson(ProjectsModel data) => json.encode(data.toJson());

class ProjectsModel {
  ProjectsModel({
    this.success,
    this.projectList,
  });

  bool success;
  List<ProjectList> projectList;

  factory ProjectsModel.fromJson(Map<String, dynamic> json) => ProjectsModel(
    success: json["success"],
    projectList: List<ProjectList>.from(json["projectList"].map((x) => ProjectList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "projectList": List<dynamic>.from(projectList.map((x) => x.toJson())),
  };
}

class ProjectList {
  ProjectList({
    this.id,
    this.name,
    this.assignedDateTime,
    this.customer,
    this.deadline,
    this.remarks,
    this.subLevels,
  });

  int id;
  String name;
  DateTime assignedDateTime;
  String customer;
  DateTime deadline;
  String remarks;
  dynamic subLevels;

  factory ProjectList.fromJson(Map<String, dynamic> json) => ProjectList(
    id: json["id"],
    name: json["name"],
    assignedDateTime: DateTime.parse(json["assignedDateTime"]),
    customer: json["customer"],
    deadline: DateTime.parse(json["deadline"]),
    remarks: json["remarks"],
    subLevels: json["subLevels"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "assignedDateTime": assignedDateTime.toIso8601String(),
    "customer": customer,
    "deadline": deadline.toIso8601String(),
    "remarks": remarks,
    "subLevels": subLevels,
  };
}
