import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/project_details.dart';
import 'package:hrms_supervisor_app/logic/projects_page.dart';
import 'package:hrms_supervisor_app/logic/specific_project_page.dart';
import 'package:hrms_supervisor_app/models/projects_model.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Projects extends StatefulWidget {
  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultBackground(
        title: "Current Projects",
        interior: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: ProjectData.getProjects(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  CurrentProjectsModel projectmodel = snapshot.data;
                  if (projectmodel.projects.length > 0) {
                    return ListView.builder(
                        itemCount: projectmodel.projects.length,
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                            child: InkWell(
                              onTap: () =>
                                  // SpecificProjectData.subLevelView(projectmodel.projects[index].id);
                                  Navigator.of(context)
                                      .pushNamed("/specificProject", arguments: ProjectDetailArgs(projectmodel.projects[index].name, projectmodel.projects[index].id)),
                              child: Container(
                                decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(15))),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 8.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                AutoSizeText(
                                                  projectmodel.projects[index].name,
                                                  maxLines: 1,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    AutoSizeText(
                                                      "Deadline : ",
                                                      style: GoogleFonts.poppins(fontSize: 15, color: Colors.black54, fontWeight: FontWeight.w600),
                                                    ),
                                                    AutoSizeText(
                                                      projectmodel.projects[index].deadline.year.toString() +
                                                          "-" +
                                                          projectmodel.projects[index].deadline.month.toString() +
                                                          "-" +
                                                          projectmodel.projects[index].deadline.day.toString(),
                                                      style: GoogleFonts.poppins(color: Colors.red, fontWeight: FontWeight.w600, fontSize: 14),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 4,
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: <Widget>[
                                                    AutoSizeText(
                                                      projectmodel.projects[index].subLevelCount.toString() + " sub projects",
                                                      style: GoogleFonts.poppins(color: Colors.black38),
                                                    ),
                                                    AutoSizeText(
                                                      projectmodel.projects[index].userCount.toString() + " Users",
                                                      style: GoogleFonts.poppins(color: Colors.black38),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                )
                                              ],
                                            ),
                                          )),
                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: CircularStepProgressIndicator(
                                            totalSteps: 100,
                                            currentStep: (projectmodel.projects[index].progress * 100).toInt(),
                                            stepSize: 17,
                                            selectedColor: Colors.orange,
                                            gradientColor: LinearGradient(
                                              colors: [Colors.orange[200], Colors.deepOrange[400]],
                                            ),
                                            unselectedColor: Colors.orange[200],
                                            padding: 0,
                                            width: 35,
                                            height: 100,
                                            selectedStepSize: 10,
                                            unselectedStepSize: 5,
                                            child: Center(
                                              child: Container(
                                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: Colors.orange),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: AutoSizeText(
                                                    (projectmodel.projects[index].progress * 100).toInt().toString() + "%",
                                                    style: GoogleFonts.poppins(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w600),
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
                                ),
                              ),
                            ),
                          );
                        });
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        height: size.height * 0.795,
                        child: Center(
                          child: AutoSizeText(
                            "0 current projects\n Pull to refresh",
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  }
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height * 0.795,
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
