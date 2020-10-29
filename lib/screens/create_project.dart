import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class CreateProject extends StatelessWidget {
  // controller for the user id
  static TextEditingController sd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


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
              InputField(),
              SubLevelList(),
              AutoSizeText(
                "Remarks",
                style: GoogleFonts.poppins(
                  fontSize: 22,
                ),
              ),
              InputField(),
              Deadline(),
              SizedBox(
                height: 35,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:25.0,vertical: 5),
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
