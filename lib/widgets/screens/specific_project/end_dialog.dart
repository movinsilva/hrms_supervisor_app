import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hrms_supervisor_app/logic/specific_project_page.dart';

class EndDialog extends StatelessWidget {
  final title;
  final id;

  const EndDialog({Key key, this.title, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: size.height*0.25,
        width: size.width*0.9,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical:25.0, horizontal: 12),
          child: Column(
            children: [
              AutoSizeText(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                      // final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
                      // Scaffold.of(context).showSnackBar(snackBar);

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: Colors.blue[200])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:27, vertical: 4),
                        child: AutoSizeText(
                          "Cancel",
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: (){
                      SpecificProjectData.endProject(id).then((value) {
                        if(value){
                          Navigator.of(context).pushNamedAndRemoveUntil("/projects", (route) => false);
                        } else {
                          Navigator.pop(context);
                        }
                      });

                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          border: Border.all(color: Colors.blue[200])
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:38, vertical: 4),
                        child: AutoSizeText(
                          "End",
                          style: GoogleFonts.poppins(
                            color: Colors.black87,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
