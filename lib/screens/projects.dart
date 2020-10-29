import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultBackground(
        title: "Current Projects",
        interior: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 8),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed("/specificProject"),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(flex: 5, child: Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  "Katugasthota Project",
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    AutoSizeText(
                                      "Deadline : ",
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    AutoSizeText(
                                      "25.11.2020",
                                      style: GoogleFonts.poppins(
                                        color: Colors.red,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 4,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(
                                      "13 sub projects",
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
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          )),
                          Expanded(flex: 2, child: Padding(
                            padding: const EdgeInsets.only(left:4.0),
                            child: CircularStepProgressIndicator(
                              totalSteps: 100,
                              currentStep: 70,
                              stepSize: 17,
                              selectedColor: Colors.orange,
                              gradientColor: LinearGradient(
                                colors: [Colors.orange[200],Colors.deepOrange[400]],
                              ),
                              unselectedColor: Colors.orange[200],
                              padding: 0,
                              width: 50,
                              height: 100,
                              selectedStepSize: 10,
                              unselectedStepSize: 5,
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    color: Colors.orange
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
                    ),
                  ),
                ),
              );
            }));
  }
}
