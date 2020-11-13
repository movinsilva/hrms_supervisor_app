import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/models/finished_projects_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HistoryData{
  static Future<FinishedProjectModel> getFinishedProjects() async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/Api/supervisorapi/getfinishedprojects?userid=" +
        RuntimeConstants.userId);
    var jsonData = json.decode(data.body);
    var map = FinishedProjectModel.fromJson(jsonData);
    return map;
  }
}