import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LoginPage {

  static String name;
  static String email;

  static userSignInAuthentication(
      {@required BuildContext context,
      String password,
      String username}) async {

    email = username.trim();
    var url =
        "http://" + RuntimeConstants.ip +":" + RuntimeConstants.port +
            "/api/windowsservice/validateUserByUsernamePassword?username=" +
            email +
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
                        resetIsLogin();
                        RuntimeConstants.name = name;
                        RuntimeConstants.email = email;
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

    name = jsonData['username'];

    return status;
  }


  //sets the user as logged in by saving in shared preference
  static Future<void> resetIsLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("isLogin", 1);
    await prefs.setString("username", name);
    await prefs.setString("email", email);
  }
}
