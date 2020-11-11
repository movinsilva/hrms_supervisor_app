import 'package:flutter/material.dart';
import 'package:hrms_supervisor_app/screens/authentication.dart';
import 'package:hrms_supervisor_app/screens/create_project.dart';
import 'package:hrms_supervisor_app/screens/history.dart';
import 'package:hrms_supervisor_app/screens/login.dart';
import 'package:hrms_supervisor_app/screens/notices.dart';
import 'package:hrms_supervisor_app/screens/projects.dart';
import 'package:hrms_supervisor_app/screens/specific_project.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // int _no;
    //
    // getIsLogin().then((value) => _no = value);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login" : (context) => Login(),
        "/projects" : (context) => Projects(),
        "/createProject" : (context) => CreateProject(),
        "/specificProject" : (context) => SpecificProject(),
        "/notices" : (context) => Notices(),
        "/history" : (context) => History(),
        "/authentication" : (context) => Authentication(),
      },
      home: Authentication(),
    );
  }


}
