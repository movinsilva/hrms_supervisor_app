import 'dart:convert';

import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:http/http.dart' as http;

class CreateProjectData {
  static Future<bool> submitSubLevels(var model) async {
    var url = await http.post(
      "http://" +
          RuntimeConstants.ip +
          ":" +
          RuntimeConstants.port +
          "/Api/supervisorapi/createproject",
      body: model,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    var jsonData = json.decode(url.body);
    var isSubmitted = jsonData['success'];
    return isSubmitted;
  }
}
