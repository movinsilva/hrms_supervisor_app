import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SelectUserData{
  static Future getUsers() async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/api/SupervisorApi/getDraughtmans");

    return data.body;

  }
}