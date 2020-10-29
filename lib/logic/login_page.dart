import 'package:flutter/material.dart';

class LoginPage {

  static userSignInAuthentication({@required BuildContext context, String password, String studenid}) {

    Navigator.of(context).pushReplacementNamed("/projects");

  }

}