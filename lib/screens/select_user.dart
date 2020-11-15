import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/args/sub_level_details.dart';
import 'package:hrms_supervisor_app/args/user_details.dart';
import 'package:hrms_supervisor_app/logic/select_user_page.dart';
import 'package:hrms_supervisor_app/models/users_model.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class SelectUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final SubLevelDetails args = ModalRoute.of(context).settings.arguments;

    return DefaultBackground(
      title: args.subLevelName.toString(),
      interior: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:18.0, bottom: 10),
            child: AutoSizeText(
              "Select User",
              style: GoogleFonts.poppins(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(child: FutureBuilder(
            future: SelectUserData.getUsers(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data != null){
                  List<UsersModel> userlist = usersModelFromJson(snapshot.data);
                  if(userlist.length>0) {
                    return ListView.builder(
                      itemCount: userlist.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(15)),
                                  border: Border.all(color: Colors.black38,
                                      width: 2.5)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CachedNetworkImage(
                                        width: size.height * 0.05,
                                        height: size.height * 0.12,
                                        imageUrl: "http://35.247.188.34/client1.png",
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            Icon(
                                              Icons.person_outline,
                                              size: 60,
                                              color: Colors.black26,
                                            ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Column(
                                          children: [
                                            AutoSizeText(userlist[index].name,
                                              style: GoogleFonts.poppins(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              ),),
                                            AutoSizeText(userlist[index].subLevelCount.toString() + " Projects  " + userlist[index].manhourCount.toString() + " Hours",
                                              style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                  color: Colors.black54
                                              ),)
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              String id = userlist[index].id;
                              String username = userlist[index].name;
                              String name = args.subLevelName;
                              int subLvlid= args.subLevelId;
                              String phone = userlist[index].phoneNumber;
                              var abc = UserDetails(id, username, name, subLvlid, phone);
                              Navigator.of(context).pushNamed("/specificSubLevel",arguments: abc);
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return SingleChildScrollView(
                      child: Container(
                        height: size.height * 0.795,
                        child: Center(
                          child: AutoSizeText(
                            "No Users \n pull to refresh",
                            style: GoogleFonts.poppins(fontSize: 17),
                          ),
                        ),
                      ),
                    );
                  }
                }
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
              return Center(
                child: Image(
                  image: AssetImage("assets/loading_dots.gif"),
                  height: 100,
                  width: 100,
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
