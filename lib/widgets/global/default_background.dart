import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class DefaultBackground extends StatelessWidget {

  final title;
  final interior;

  const DefaultBackground({Key key, this.title, this.interior}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    AppBar appBar = AppBar(
      iconTheme: new IconThemeData(color: Colors.black),
      backgroundColor: Colors.white10,
      elevation: 0,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image(
            image: AssetImage("assets/company_img.png"),
            height: 30,
          ),
        ),
      ],
    );
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: NavigationDrawer(),
      appBar: appBar,
      body:  Container(
        width: double.infinity,
        height: double.infinity,
        child: FittedBox(
            fit: BoxFit.contain ,
            child: Container(
              height: size.height-appBarHeight-statusBarHeight,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: size.width*0.65,
                    height: size.height*0.06,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blue[900], Colors.blue[300]] ,
                      ),
                        borderRadius:
                        BorderRadius.only(topRight: Radius.circular(25), bottomRight: Radius.circular(25))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 25, top: 3, bottom: 3),
                      child: Center(
                        child: AutoSizeText(
                          title,
                          maxLines: 1,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: interior,
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
