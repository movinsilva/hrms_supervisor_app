import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
      title: "Project History",
      interior: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(12))
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical:8.0, horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AutoSizeText(
                  "Wellampitiya project",
                  maxLines: 1,
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                AutoSizeText(
                  "Completed on 25.10.2020",
                  style: GoogleFonts.poppins(
                    color: Colors.orange,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      "13 sub Levels",
                      style: GoogleFonts.poppins(
                          color: Colors.black38
                      ),
                    ),
                    AutoSizeText(
                      "6 Users",
                      style: GoogleFonts.poppins(
                          color: Colors.black38
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
