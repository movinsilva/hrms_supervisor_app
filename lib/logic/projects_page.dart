import 'package:hrms_supervisor_app/models/projects_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ProjectData {

   static Future<ProjectsModel> getProjects() async {
     var data = await http.get("http://192.168.1.6:5000/Api/supervisorapi/getprojects");
     var jsonData = json.decode(data.body);

       var map = ProjectsModel.fromJson(jsonData);

     return map;

  }

}