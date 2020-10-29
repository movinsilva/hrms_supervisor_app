import 'package:flutter/material.dart';
import 'package:hrms_supervisor_app/screens/assign_projects.dart';
import 'package:hrms_supervisor_app/screens/create_project.dart';
import 'package:hrms_supervisor_app/screens/login.dart';
import 'package:hrms_supervisor_app/screens/projects.dart';
import 'package:hrms_supervisor_app/screens/specific_project.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/login" : (context) => Login(),
        "/projects" : (context) => Projects(),
        "/createProject" : (context) => CreateProject(),
        "/assignProjects" : (context) => AssignProjects(),
        "/specificProject" : (context) => SpecificProject(),
      },
      home: Login(),
    );
  }
}
