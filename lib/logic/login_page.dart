import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage {
  static userSignInAuthentication(
      {@required BuildContext context,
      String password,
      String username}) async {
    var url =
        "http://192.168.1.6:5000/api/SupervisorApi/LoginSupervisor?username=" +
            username.trim() +
            "&password=" +
            password;

    showGeneralDialog(
        context: context,
        pageBuilder: (BuildContext context, _, __) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: (username.length == 0 || password.length == 0) ? LoginDialog(title: "Please enter username and password",page: "pop",) : FutureBuilder(
                future: getAccess(url),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.data != null) {
                      if (snapshot.data) {
                        return LoginDialog(
                          title: "Successfully Logged in",
                          page: "/projects",
                        );
                      } else {
                        return LoginDialog(
                          title: "Invalid Credentials",
                          page: "pop",
                        );
                      }
                    } else {
                      return LoginDialog(
                        title: "Please check your internet connection",
                        page: "pop",
                      );
                    }
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          );
        });
  }

  static Future<bool> getAccess(var link) async {
    var value = await http.get(link).timeout(Duration(seconds: 20));

    var jsonData = json.decode(value.body);

    var status = jsonData['success'];

    return status;
  }
}
