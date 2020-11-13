import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/models/new_projects_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class NewProjectData{

  static Future<NewProjectModel> getNewProjects() async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/Api/supervisorapi/getupcomingprojects?userid=" +
        RuntimeConstants.userId);
    var jsonData = json.decode(data.body);
    var map = NewProjectModel.fromJson(jsonData);
    return map;
  }

}