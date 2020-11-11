import 'package:flutter/material.dart';
import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
   String namelbl;
   String emaillbl;

  @override
  void initState() {
    super.initState();
    getIsLogin().then((value) {
        if(value ==1){
          Navigator.of(context).pushReplacementNamed("/projects");
          RuntimeConstants.name = namelbl;
          RuntimeConstants.email = emaillbl;
        } else {
          Navigator.of(context).pushReplacementNamed("/login");
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
              child: Image(
                image: AssetImage("assets/loading_dots.gif"),
                height: 100,
                width: 100,
              ),
            ),
    );
  }

  Future<int> getIsLogin() async {

    final prefs = await SharedPreferences.getInstance();
    final int isLogin = prefs.getInt("isLogin");
    namelbl = prefs.getString("username");
    emaillbl = prefs.getString("email");
    return isLogin;

  }
}
