import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SpecificProject extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return DefaultBackground(
      title: "Katugasthota Project",
      interior: ListView.builder(
          itemCount: 3,
          itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(flex: 5, child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            AutoSizeText(
                              "Sub Level Project 01",
                              maxLines: 1,
                              style: GoogleFonts.poppins(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                AutoSizeText(
                                  "Eng. Kelum De Silva",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 4,),
                            Row(
                              children: <Widget>[
                                AutoSizeText(
                                  "status : ",
                                  style: GoogleFonts.poppins(
                                      color: Colors.orangeAccent
                                  ),
                                ),
                                AutoSizeText(
                                  "Active",
                                  style: GoogleFonts.poppins(
                                      color: Colors.lightGreen[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17
                                  ),
                                ),
                                Spacer(),
                                IconButton(
                                  icon: Icon(Icons.edit,
                                  color: Colors.black54,
                                  size: 25,),
                                )
                              ],
                            ),
                          ],
                        ),
                      )),
                      Expanded(flex: 2, child: Padding(
                        padding: const EdgeInsets.only(left:8.0),
                        child: CircularStepProgressIndicator(
                          totalSteps: 100,
                          currentStep: 70,
                          stepSize: 17,
                          selectedColor: Colors.orange,
                          gradientColor: LinearGradient(
                            colors: [Colors.green[300],Colors.blue[400]],
                          ),
                          unselectedColor: Colors.orange[200],
                          padding: 0,
                          width: 40,
                          height: 100,
                          selectedStepSize: 10,
                          unselectedStepSize: 5,
                          child: Center(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  color: Colors.blue[300]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: AutoSizeText(
                                  "70%",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                          roundedCap: (_, __) => true,
                        ),
                      ),),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 4),
                        child: Icon(Icons.call,
                        color: Colors.black87,),
                      ),
                      AutoSizeText(
                        "Contact",
                        style: GoogleFonts.poppins(
                          color: Colors.black54
                        ),
                      ),
                      Spacer(),
                      AutoSizeText(
                        "Deadline : ",
                        style: GoogleFonts.poppins(
                          color: Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      AutoSizeText(
                        "25.11.2020",
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
