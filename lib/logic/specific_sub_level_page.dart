import 'dart:convert';

import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:http/http.dart' as http;

class SpecificSubLevelData{
  static Future<bool> assignUser(var map) async {



    var url = await http.post(
      "http://" +
          RuntimeConstants.ip +
          ":" +
          RuntimeConstants.port +
          "/Api/supervisorapi/submitsublevel",
      body: map,
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
    );
    var jsonData = json.decode(url.body);
    var isSubmitted =jsonData['success'];
    return isSubmitted;
  }
}