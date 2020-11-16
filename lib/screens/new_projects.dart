import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/new_project_details.dart';
import 'package:hrms_supervisor_app/logic/new_projects_page.dart';
import 'package:hrms_supervisor_app/models/new_projects_model.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class NewProjects extends StatefulWidget {
  @override
  _NewProjectsState createState() => _NewProjectsState();
}

class _NewProjectsState extends State<NewProjects> {
  GlobalKey<RefreshIndicatorState> refreshKey =
  GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultBackground(
      title: "New Projects",
      interior: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: NewProjectData.getNewProjects(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.data != null) {
                NewProjectModel model = snapshot.data;
                if (model.upcomingProjects.length > 0) {
                  return ListView.builder(
                    itemCount: model.upcomingProjects.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed("/createProject",
                                arguments: NewProjectDetailArgs(
                                    model.upcomingProjects[index].name,
                                    model.upcomingProjects[index].id,
                                    model.upcomingProjects[index].deadline,
                                    model.upcomingProjects[index].remark));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                            child: Padding(
                              padding: const EdgeInsets.only(left:22.0, top: 12, bottom: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AutoSizeText(
                                    model.upcomingProjects[index].name,
                                    maxLines: 1,
                                    style: GoogleFonts.poppins(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      AutoSizeText(
                                        "Deadline : ",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontWeight:
                                            FontWeight.w600),
                                      ),
                                      AutoSizeText(
                                        model.upcomingProjects[index]
                                            .deadline.year
                                            .toString() +
                                            "-" +
                                            model
                                                .upcomingProjects[index]
                                                .deadline
                                                .month
                                                .toString() +
                                            "-" +
                                            model
                                                .upcomingProjects[index]
                                                .deadline
                                                .day
                                                .toString(),
                                        style: GoogleFonts.poppins(
                                            color: Colors.red,
                                            fontWeight:
                                            FontWeight.w600,
                                            fontSize: 15),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height*0.795,
                      child: Center(
                        child: AutoSizeText(
                          "No New Projects \n pull to refresh",
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
      ),
    );
  }
}
