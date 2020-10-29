import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class SubLevelList extends StatefulWidget {
  @override
  _SubLevelListState createState() => _SubLevelListState();
}

class _SubLevelListState extends State<SubLevelList> {

  int subLevels = 3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            AutoSizeText(
              "Project Sub Levels",
              style: GoogleFonts.poppins(
                fontSize: 22,
              ),
            ),
            IconButton(
              icon: Icon(Icons.add_circle,
                size: 32,),
              onPressed: () {
                setState(() {
                  subLevels++;
                });
              },
            )
          ],
        ),
        Container(
          width: size.width,
          height: size.height*0.1*subLevels,
          child: ListView.builder(
              itemCount: subLevels,
              itemBuilder: (_,index) {
                return InputField();
              }),
        )
      ],
    );
  }
}
