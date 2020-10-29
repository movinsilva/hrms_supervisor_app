import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Deadline extends StatefulWidget {
  @override
  _DeadlineState createState() => _DeadlineState();
}

class _DeadlineState extends State<Deadline> {

  DateTime _dateTime;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AutoSizeText(
            "Deadline",
            style: GoogleFonts.poppins(
              fontSize: 22,
            ),
          ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width*0.65,
            height: 50,
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
                      (_dateTime == null) ? "Add Date" :
                    _dateTime.year.toString() + "-" + _dateTime.month.toString()
                        + "-" + _dateTime.day.toString(),
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.date_range,
                  size: 30,),
                  onPressed: () {
                    showDatePicker(context: context, initialDate: DateTime.now(),
                        firstDate: DateTime(2000), lastDate: DateTime(2100))
                        .then((date) {
                      setState(() {
                       _dateTime= date;
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
