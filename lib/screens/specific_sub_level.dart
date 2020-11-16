import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/user_details.dart';
import 'package:hrms_supervisor_app/logic/specific_sub_level_page.dart';
import 'package:hrms_supervisor_app/widgets/global/default_background.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:sms/sms.dart';
import 'package:intl/intl.dart';

class SpecificSubLevel extends StatelessWidget {
  static TextEditingController remarksController = TextEditingController();
  static TextEditingController priorityLvlController = TextEditingController();
  static TextEditingController manHoursController = TextEditingController();

  static DateTime dateTime;


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final UserDetails args = ModalRoute.of(context).settings.arguments;


    return DefaultBackground(
      title: args.subLvlName.toString(),
      interior: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutoSizeText(
                "User",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:8.0),
                child: Container(
                  width: size.width * 0.93,
                  height: size.height * 0.06,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                      border: Border.all(color: Colors.black12, width: 4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: AutoSizeText(
                          args.userName,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AutoSizeText(
                "Remarks",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                ),
              ),
              InputFormFieldSizes(maxLines: 3, controller: remarksController,),
              Deadline(),
              AutoSizeText(
                "Man Hours",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200.0),
                child: InputFormFieldSizes(keyboardType: TextInputType.number,maxLines: 1, controller: manHoursController,),
              ),
              AutoSizeText(
                "Priority Level",
                style: GoogleFonts.poppins(
                  fontSize: 19,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right:200),
                child: InputFormFieldSizes(keyboardType: TextInputType.number,maxLines: 1, maxNo: 1, controller: priorityLvlController,),
              ),
              SizedBox(
                height: 35,
              ),
              Center(
                child: InkWell(
                  onTap: () {


                    var map = {
                      "ID" : args.subLvlId,
                      "UserID" : args.userId,
                      "Remark" : remarksController.text,
                      "Deadline" : dateTime.toString(),
                      "ManHours" : int.parse(manHoursController.text),
                      "PriorityLevel" : int.parse(priorityLvlController.text),
                    };

                    final DateFormat formatter = DateFormat('yyyy-MM-dd');
                    final String formatted = formatter.format(dateTime);

                    var i = jsonEncode(map);

                    SpecificSubLevelData.assignUser(i).then((value) {
                      if(value){
                        SmsSender sender = new SmsSender();
                        sender.sendSms(new SmsMessage(args.phoneNo, args.subLvlName + " Part of a project has been assigned to you, Deadline is " + formatted));

                        priorityLvlController.text = "";
                        manHoursController.text = "";
                        remarksController.text = "";

                        Navigator.of(context).popUntil(ModalRoute.withName('/specificProject'));
                      } else{
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Couldn't Assign, Please try again"),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
