import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/logic/tasks_page.dart';
import 'package:hrms_supervisor_app/models/tasks_model.dart';
import 'package:hrms_supervisor_app/widgets/global/default_background.dart';

class Tasks extends StatefulWidget {
  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  GlobalKey<RefreshIndicatorState> refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultBackground(
      title: "Special Tasks",
      key: refreshKey,
      interior: RefreshIndicator(
        onRefresh: () async {
          setState(() {
          });
        },
        child: FutureBuilder(
          future: TasksData.getTasks(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              if(snapshot.data != null){
                TasksModel model = snapshot.data;
                if(model.specialTasks.length>0){
                  return ListView.builder(
                    itemCount: model.specialTasks.length,
                    itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                            BorderRadius.all(Radius.circular(15))),
                        child: Padding(
                          padding: const EdgeInsets.only(left:22.0, top: 12, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AutoSizeText(
                                model.specialTasks[index].name,
                                maxLines: 3,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
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
                                        fontSize: 14,
                                        color: Colors.black54,
                                        fontWeight:
                                        FontWeight.w600),
                                  ),
                                  AutoSizeText(
                                    model.specialTasks[index]
                                        .deadline.year
                                        .toString() +
                                        "-" +
                                        model
                                            .specialTasks[index]
                                            .deadline
                                            .month
                                            .toString() +
                                        "-" +
                                        model
                                            .specialTasks[index]
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
                    );
                  },);
                } else{
                  return SingleChildScrollView(
                    child: Container(
                      height: size.height * 0.795,
                      child: Center(
                        child: AutoSizeText(
                          "0 current tasks\n Pull to refresh",
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
      ),
    );
  }
}
