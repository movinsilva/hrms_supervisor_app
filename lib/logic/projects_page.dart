import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/models/projects_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProjectData {

   static Future<CurrentProjectsModel> getProjects() async {
     var data = await http.get("http://" + RuntimeConstants.ip + ":" + RuntimeConstants.port + "/Api/supervisorapi/getallunfinishedprojects?username=" + RuntimeConstants.email);
     var jsonData = json.decode(data.body);
     var map = CurrentProjectsModel.fromJson(jsonData);
    // return Future.delayed(Duration(seconds: 1)).then((value) => map);
    return map;

  }



}