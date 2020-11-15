import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/screens/create_project.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class SubLevelList extends StatefulWidget {
  HashMap<int, TextEditingController> _controllers;

  SubLevelList(this._controllers);

  @override
  _SubLevelListState createState() => _SubLevelListState();
}

class _SubLevelListState extends State<SubLevelList> {



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
                  CreateProject.subLevelList++;
                });
              },
            )
          ],
        ),
        Container(
          width: size.width,
          height: size.height*0.1*CreateProject.subLevelList,
          child: ListView.builder(
              itemCount: CreateProject.subLevelList,
              itemBuilder: (_,index) {
               widget._controllers.putIfAbsent(index, () => new TextEditingController());
                return InputField(controller: widget._controllers[index],);
              }),
        ),
      ],
    );
  }
}
