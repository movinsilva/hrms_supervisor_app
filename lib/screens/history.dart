import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/logic/history_page.dart';
import 'package:hrms_supervisor_app/models/finished_projects_model.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  GlobalKey<RefreshIndicatorState> refreshKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultBackground(
        title: "Project History",
        interior: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {
            setState(() {});
          },
          child: FutureBuilder(
            future: HistoryData.getFinishedProjects(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data != null) {
                  FinishedProjectModel model = snapshot.data;
                  if (model.projects.length > 0) {
                    return ListView.builder(
                      itemCount: model.projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 22),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                AutoSizeText(
                                  model.projects[index].name.toString(),
                                  maxLines: 1,
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                AutoSizeText(
                                  "Completed on " +
                                      model.projects[index].finishedDate.day
                                          .toString() +
                                      "-" +
                                      model.projects[index].finishedDate.month
                                          .toString() +
                                      "-" +
                                      model.projects[index].finishedDate.year
                                          .toString(),
                                  style: GoogleFonts.poppins(
                                    color: Colors.orange,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    AutoSizeText(
                                      model.projects[index].subLevelCount
                                              .toString() +
                                          " sub Levels",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                          color: Colors.black38),
                                    ),
                                    AutoSizeText(
                                      model.projects[index].userCount
                                              .toString() +
                                          " Users",
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                          color: Colors.black38),
                                    )
                                  ],
                                ),
                              ],
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
                            "No Finished Projects\n pull to refresh",
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
