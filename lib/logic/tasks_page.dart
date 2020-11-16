import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/models/tasks_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TasksData{
  static Future<TasksModel> getTasks() async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/Api/supervisorapi/getspecialtasks?userid=" +
        RuntimeConstants.userId);
    var jsonData = json.decode(data.body);
    var map = TasksModel.fromJson(jsonData);
    return map;
  }
}