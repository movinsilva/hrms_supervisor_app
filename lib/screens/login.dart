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
                  height: 130,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:50.0),
                  child: Image(
                    image: AssetImage("assets/company_img.png"),
                  ),
                ),
                SizedBox(
                  height: 80,
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
