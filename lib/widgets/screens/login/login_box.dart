import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/logic/login_page.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class LoginBox extends StatelessWidget {

  // controller for the user id
  static TextEditingController _usernameController = TextEditingController();

  // controller for the login password
  static TextEditingController _loginPasswordController =
  TextEditingController();


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Container(
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            border: Border.all(
              color: Colors.black,
              width: 1
            )
          ),
          margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 22),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23.0,vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                AutoSizeText(
                  "Login",
                  style: GoogleFonts.poppins(
                    fontSize: 38,
                    fontWeight: FontWeight.w600
                  )
                ),
                SizedBox(
                  height: 8,
                ),
                InputFormField(
                    controller: _usernameController, label: "Username", keyboardType : TextInputType.text),
                SizedBox(
                  height: 12,
                ),
                InputFormField(
                  label: "Password",
                  controller: _loginPasswordController,
                  obsecureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            /// get the password here and pass to the authentication method
                            LoginPage.userSignInAuthentication(
                                context: context,
                                password: _loginPasswordController.text,
                                username: _usernameController.text);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(15))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 15),
                              child: AutoSizeText(
                                "Sign in",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
