import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/models/sub_levels_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SpecificProjectData {
  static Future<SubLevelsModel> getSubLevels(int id) async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/Api/supervisorapi/getallsublevelsforprojectid?projectid=" +
        id.toString());
    var jsonData = json.decode(data.body);
    var map = SubLevelsModel.fromJson(jsonData);
    // return Future.delayed(Duration(seconds: 1)).then((value) => map);
    return map;
  }

  static Future endProject(int id) async {
    var data = await http.get("http://" +
        RuntimeConstants.ip +
        ":" +
        RuntimeConstants.port +
        "/Api/supervisorapi/finishproject?projectid=" +
        id.toString());

    var jsondata = json.decode(data.body);
    var status = jsondata['success'];
    return status;


  }


}
