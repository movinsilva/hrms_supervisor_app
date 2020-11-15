// To parse this JSON data, do
//
//     final usersModel = usersModelFromJson(jsonString);

import 'dart:convert';

List<UsersModel> usersModelFromJson(String str) => List<UsersModel>.from(json.decode(str).map((x) => UsersModel.fromJson(x)));

String usersModelToJson(List<UsersModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UsersModel {
  UsersModel({
    this.id,
    this.name,
    this.phoneNumber,
    this.manhourCount,
    this.subLevelCount,
  });

  String id;
  String name;
  String phoneNumber;
  int manhourCount;
  int subLevelCount;

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
    id: json["id"],
    name: json["name"],
    phoneNumber: json["phoneNumber"],
    manhourCount: json["manhourCount"],
    subLevelCount: json["subLevelCount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phoneNumber": phoneNumber,
    "manhourCount": manhourCount,
    "subLevelCount": subLevelCount,
  };
}
