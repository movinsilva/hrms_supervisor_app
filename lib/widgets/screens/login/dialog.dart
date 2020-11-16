import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginDialog extends StatelessWidget {

  final title;
  final page;

  const LoginDialog({Key key, this.title, this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height*0.4,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Container(
          height: size.height*0.22,
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
                InkWell(
                  onTap: () {
                    if(page == "pop") {
                      Navigator.pop(context);
                    } else{
                      Navigator.of(context).pushNamedAndRemoveUntil(page, (route) => false);
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(color: Colors.blue[200])
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:40, vertical: 4),
                      child: AutoSizeText(
                        "OK",
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
