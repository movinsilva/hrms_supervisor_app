import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/constants/runtime_constants.dart';
import 'package:hrms_supervisor_app/widgets/widget_library.dart';

class NavigationDrawer extends StatelessWidget {
  // arrays for the drawer and the image data for the
  // icons
  var drawer_titles = [
    "Projects",
    "Create Project",
    "Assign Projects",
  ];
  var drawer_icons = [
    Icons.featured_play_list,
    Icons.create_new_folder,
    Icons.people,
  ];

  var drawer_routes = [
    "/projects",
    "/createProject",
    "/assignProjects",
  ];

  @override
  Widget build(BuildContext context) {
    // Get the size of the current screen
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.72,
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.only(right: 25),
              width: double.infinity,
              height: size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.blue[900],
              ),
              child: Center(
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    ClipOval(
                      child: CachedNetworkImage(
                        width: size.height * 0.1,
                        height: size.height * 0.1,
                        imageUrl: "http://35.247.188.34/client1.png",
                        placeholder: (context, url) =>
                            CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(
                          Icons.person_outline,
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            AutoSizeText(
                              "Supervisor",
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                              maxLines: 1,
                              textAlign: TextAlign.start,
                            ),
                            FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 28.0),
                                child: AutoSizeText(
                                  "Kasun Perera",
                                  style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 28,
                                      color: Colors.white),
                                  maxLines: 2,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    )
                  ],
                ),
              )),
          Expanded(
            child: Stack(
              children: [
                Container(
                  color: Colors.blue[900],
                  width: 100,
                  height: double.infinity,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            offset: Offset(10, 10),
                            spreadRadius: -10)
                      ]),
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: size.height * 0.7,
                      child: ListView.builder(
                        itemBuilder: (context, index) => DrawerTile(
                          isSelected: index == RuntimeConstants.selectIndex,
                          title: drawer_titles[index],
                          iconData: drawer_icons[index],
                          onTap: () {
                            RuntimeConstants.currentPageName =
                                drawer_titles[index];
                            RuntimeConstants.selectIndex = index;
                            Navigator.of(context)
                                .pushReplacementNamed(drawer_routes[index]);
                          },
                        ),
                        itemCount: drawer_titles.length,
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Log out",
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.black54,
                        ),
                      ),
                      onTap: () {},
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
