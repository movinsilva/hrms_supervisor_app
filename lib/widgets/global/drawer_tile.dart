
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerTile extends StatelessWidget {
  // Hold the text to be showed in the drawerTile
  final title;

  // Will pass the corresponding lambda function for
  // the touch action
  final onTap;

  // Will pass the corresponding icon data
  final iconData;

  // Pass whether the item is selected
  final isSelected;

  const DrawerTile({Key key, @required this.title, this.onTap, this.iconData, this.isSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: isSelected ? Colors.blue :  Colors.white,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2,
          color: isSelected ? Colors.blue : Colors.black54,
        ),
      ),
      onTap: onTap,
    );
  }
}
