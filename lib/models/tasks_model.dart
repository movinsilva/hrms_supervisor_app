// To parse this JSON data, do
//
//     final tasksModel = tasksModelFromJson(jsonString);

import 'dart:convert';

TasksModel tasksModelFromJson(String str) => TasksModel.fromJson(json.decode(str));

String tasksModelToJson(TasksModel data) => json.encode(data.toJson());

class TasksModel {
  TasksModel({
    this.success,
    this.specialTasks,
  });

  bool success;
  List<SpecialTask> specialTasks;

  factory TasksModel.fromJson(Map<String, dynamic> json) => TasksModel(
    success: json["success"],
    specialTasks: List<SpecialTask>.from(json["specialTasks"].map((x) => SpecialTask.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "specialTasks": List<dynamic>.from(specialTasks.map((x) => x.toJson())),
  };
}

class SpecialTask {
  SpecialTask({
    this.id,
    this.userId,
    this.name,
    this.email,
    this.deadline,
    this.isFinished,
    this.user,
  });

  int id;
  String userId;
  String name;
  String email;
  DateTime deadline;
  bool isFinished;
  dynamic user;

  factory SpecialTask.fromJson(Map<String, dynamic> json) => SpecialTask(
    id: json["id"],
    userId: json["userID"],
    name: json["name"],
    email: json["email"],
    deadline: DateTime.parse(json["deadline"]),
    isFinished: json["isFinished"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userID": userId,
    "name": name,
    "email": email,
    "deadline": deadline.toIso8601String(),
    "isFinished": isFinished,
    "user": user,
  };
}
