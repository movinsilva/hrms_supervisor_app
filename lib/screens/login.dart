import 'package:flutter/material.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: size.height*0.16,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:5.0),
                  child: Image(
                    image: AssetImage("assets/logo_img.png"),
                  ),
                ),
                SizedBox(
                  height: size.height*0.1,
                ),
                LoginBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
