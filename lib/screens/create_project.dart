import 'dart:collection';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/new_project_details.dart';
import 'package:hrms_supervisor_app/logic/create_project_page.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'dart:convert';

class CreateProject extends StatelessWidget {
  // controller for the user id
  HashMap<int, TextEditingController> controllers = new HashMap();
  static int subLevelList = 3;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final NewProjectDetailArgs args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
      title: "Create Project",
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                "Project Name",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.88,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.black12, width: 4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          args.projectName,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SubLevelList(controllers),
              AutoSizeText(
                "Remarks",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.88,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.black12, width: 4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          args.remark,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                "Deadline",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.black12, width: 4)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AutoSizeText(
                            args.deadline.year.toString() +
                                "-" +
                                args.deadline.month.toString() +
                                "-" +
                                args.deadline.day.toString(),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        Icon(Icons.date_range),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    var sublevelnamelist = List<String>();

                    for (int i = 0; i < controllers.length; i++) {
                      sublevelnamelist.add(controllers[i].text.toString());
                    }
                    var map = {
                      "ID": args.projectId,
                      "SubLevelNameList": sublevelnamelist
                    };
                    var i = jsonEncode(map);
                    CreateProjectData.submitSubLevels(i).then((value) {
                      if (value) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "/projects", (route) => false);
                      } else {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Couldn't create sub levels"),
                        ));
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25.0, vertical: 5),
                      child: AutoSizeText(
                        "Confirm",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
