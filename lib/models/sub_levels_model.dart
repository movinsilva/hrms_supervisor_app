// To parse this JSON data, do
//
//     final subLevelsModel = subLevelsModelFromJson(jsonString);

import 'dart:convert';

SubLevelsModel subLevelsModelFromJson(String str) => SubLevelsModel.fromJson(json.decode(str));

String subLevelsModelToJson(SubLevelsModel data) => json.encode(data.toJson());

class SubLevelsModel {
  SubLevelsModel({
    this.success,
    this.sublevels,
  });

  bool success;
  List<Sublevel> sublevels;

  factory SubLevelsModel.fromJson(Map<String, dynamic> json) => SubLevelsModel(
    success: json["success"],
    sublevels: List<Sublevel>.from(json["sublevels"].map((x) => Sublevel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "sublevels": List<dynamic>.from(sublevels.map((x) => x.toJson())),
  };
}

class Sublevel {
  Sublevel({
    this.id,
    this.userId,
    this.projectId,
    this.name,
    this.remark,
    this.deadline,
    this.manHours,
    this.progressFraction,
    this.priorityLevel,
    this.isActive,
    this.user,
  });

  int id;
  String userId;
  int projectId;
  String name;
  String remark;
  DateTime deadline;
  int manHours;
  double progressFraction;
  int priorityLevel;
  bool isActive;
  User user;

  factory Sublevel.fromJson(Map<String, dynamic> json) => Sublevel(
    id: json["id"],
    userId: json["userID"],
    projectId: json["projectID"],
    name: json["name"],
    remark: json["remark"],
    deadline: DateTime.parse(json["deadline"]),
    manHours: json["manHours"],
    progressFraction: json["progressFraction"].toDouble(),
    priorityLevel: json["priorityLevel"],
    isActive: json["isActive"],
    user:(json["userID"] == null)? User() : User.fromJson(json["user"])  ,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userID": userId,
    "projectID": projectId,
    "name": name,
    "remark": remark,
    "deadline": deadline.toIso8601String(),
    "manHours": manHours,
    "progressFraction": progressFraction,
    "priorityLevel": priorityLevel,
    "isActive": isActive,
    "user": user.toJson(),
  };
}

class User {
  User({
    this.name,
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.phoneNumberConfirmed,

  });

  String name;
  String id;
  String userName;
  String email;
  String phoneNumber;
  bool phoneNumberConfirmed;


  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"] ?? "",
    id: json["id"]  ?? "",
    userName: json["userName"]  ?? "",
    email: json["email"]  ?? "",
    phoneNumber: json["phoneNumber"]  ?? "",
    phoneNumberConfirmed: json["phoneNumberConfirmed"] ?? "",

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "id": id,
    "userName": userName,
    "email": email,
    "phoneNumber": phoneNumber,
    "phoneNumberConfirmed": phoneNumberConfirmed,

  };
}
