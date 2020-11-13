import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/project_details.dart';
import 'package:hrms_supervisor_app/logic/specific_project_page.dart';
import 'package:hrms_supervisor_app/models/sub_levels_model.dart';
import 'package:hrms_supervisor_app/widgets/screens/specific_project/end_dialog.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificProject extends StatefulWidget {
  @override
  _SpecificProjectState createState() => _SpecificProjectState();
}

class _SpecificProjectState extends State<SpecificProject> {
  GlobalKey<RefreshIndicatorState> _refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ProjectDetailArgs args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
        title: args.projectName,
        interior: RefreshIndicator(
          key: _refreshKey,
          onRefresh: () async {
           setState(() {

           });
          },
          child: FutureBuilder(
            future: SpecificProjectData.getSubLevels(args.projectId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  SubLevelsModel model = snapshot.data;
                  if(model.sublevels.length>0) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: model.sublevels.length,
                              itemBuilder: (_, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Expanded(
                                                  flex: 5,
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .only(
                                                        left: 8.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        AutoSizeText(
                                                          (model
                                                              .sublevels[index]
                                                              .name !=
                                                              null)
                                                              ? model
                                                              .sublevels[index]
                                                              .name
                                                              : "null",
                                                          maxLines: 1,
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 22,
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            color: Colors
                                                                .black87,
                                                          ),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                          children: <Widget>[
                                                            AutoSizeText(
                                                              (model
                                                                  .sublevels[index]
                                                                  .user.name !=
                                                                  null)
                                                                  ? model
                                                                  .sublevels[index]
                                                                  .user
                                                                  .name
                                                                  : "null",
                                                              style:
                                                              GoogleFonts
                                                                  .poppins(
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .black54,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 4,
                                                        ),
                                                        Row(
                                                          children: <Widget>[
                                                            AutoSizeText(
                                                              "status : ",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                  color: Colors
                                                                      .orangeAccent),
                                                            ),
                                                            AutoSizeText(
                                                              "Active",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                  color: Colors
                                                                      .lightGreen[400],
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  fontSize: 17),
                                                            ),
                                                            Spacer(),
                                                            IconButton(
                                                              onPressed: (){},
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color: Colors
                                                                    .black54,
                                                                size: 25,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  )),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      left: 8.0),
                                                  child: CircularStepProgressIndicator(
                                                    totalSteps: 100,
                                                    currentStep: (model
                                                        .sublevels[index]
                                                        .progressFraction *
                                                        100)
                                                        .toInt(),
                                                    stepSize: 17,
                                                    selectedColor: Colors
                                                        .orange,
                                                    gradientColor: LinearGradient(
                                                      colors: [
                                                        Colors.green[300],
                                                        Colors.blue[400]
                                                      ],
                                                    ),
                                                    unselectedColor: Colors
                                                        .orange[200],
                                                    padding: 0,
                                                    width: 40,
                                                    height: 100,
                                                    selectedStepSize: 10,
                                                    unselectedStepSize: 5,
                                                    child: Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    100)),
                                                            color: Colors
                                                                .blue[300]),
                                                        child: Padding(
                                                          padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                          child: AutoSizeText(
                                                            (model
                                                                .sublevels[index]
                                                                .progressFraction *
                                                                100)
                                                                .toInt()
                                                                .toString() +
                                                                "%",
                                                            style: GoogleFonts
                                                                .poppins(
                                                                fontSize: 15,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    roundedCap: (_, __) => true,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 6,
                                          ),
                                          Row(
                                            children: <Widget>[
                                              InkWell(
                                                onTap: () {
                                                  launch("tel://" +
                                                      model.sublevels[index]
                                                          .user.phoneNumber);
                                                },
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 20, right: 4),
                                                      child: Icon(
                                                        Icons.call,
                                                        color: Colors.black87,
                                                      ),
                                                    ),
                                                    AutoSizeText(
                                                      "Contact",
                                                      style: GoogleFonts
                                                          .poppins(
                                                          color: Colors
                                                              .black54),
                                                    ),
                                                  ],
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
                                                model.sublevels[index]
                                                    .deadline.year
                                                    .toString() +
                                                    "-" +
                                                    model
                                                        .sublevels[index]
                                                        .deadline
                                                        .month
                                                        .toString() +
                                                    "-" +
                                                    model
                                                        .sublevels[index]
                                                        .deadline
                                                        .day
                                                        .toString(),
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
                        ),
                        Visibility(
                          visible: (model.sublevels.length > 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () =>
                                    showGeneralDialog(context: context,
                                        pageBuilder: (BuildContext context, _,
                                            __) {
                                          return Scaffold(
                                            backgroundColor: Colors.transparent,
                                            body: Center(
                                              child: EndDialog(
                                                title: "Are you sure to end the project?",
                                                id: args.projectId,),
                                            ),
                                          );
                                        }),
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(14)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 6),
                                    child: AutoSizeText(
                                      "End Project",
                                      style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Colors.blue[700],
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return SingleChildScrollView(
                        child: Container(
                          height: size.height*0.795,
                          child: Center(
                            child: AutoSizeText(
                              "No sub levels\nPull to refresh",
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                          ),
                        ),
                    );
                  }
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height*0.795,
                      child: Center(
                        child: AutoSizeText(
                          "No Data \n pull to refresh",
                          style: GoogleFonts.poppins(fontSize: 17),
                        ),
                      ),
                    ),
                  );
                }
              } else {
                return Center(
                  child: Image(
                    image: AssetImage("assets/loading_dots.gif"),
                    height: 100,
                    width: 100,
                  ),
                );
              }
            },
          ),
        ));
  }


}

