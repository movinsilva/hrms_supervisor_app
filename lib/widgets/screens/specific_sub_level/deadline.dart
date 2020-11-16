import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/screens/specific_sub_level.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class Deadline extends StatefulWidget {
  @override
  _DeadlineState createState() => _DeadlineState();
}

class _DeadlineState extends State<Deadline> {



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
            "Deadline",
            style: GoogleFonts.poppins(
              fontSize: 19,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: size.width*0.65,
            height: size.height*0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              border: Border.all(color: Colors.black12,
              width: 4)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:8.0),
                  child: AutoSizeText(
                    SpecificSubLevel.dateTime?.year.toString() + "-" + SpecificSubLevel.dateTime?.month.toString()
                        + "-" + SpecificSubLevel.dateTime?.day.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.date_range,
                  size: 22,),
                  onPressed: () {
                    showDatePicker(context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), lastDate: DateTime(2100))
                        .then((date) {
                      setState(() {
                        SpecificSubLevel.dateTime= date;
                      });
                    });
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
