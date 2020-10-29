import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputFormField extends StatelessWidget {

  // this will store the value for the label
  // this is provided by the constructor
  final label;

  // this will store the value for the hint
  // this is provided by the constructor
  final hint;

  // this will store the value for the controller
  // this is provided by the constructor
  // use this to get the current details of the form field
  final controller;

  // this will decide the keyboard type of the input
  // field
  final keyboardType;

  // this will descide whether to scecure the inpur
  // or not
  final obsecureText;

  InputFormField({Key key, @required this.label,this.hint, this.controller, this.keyboardType, this.obsecureText = false }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.black,
                width: 2
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 2.5,
                color: Colors.black
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          labelText: label,
          hintText: hint,
          hintMaxLines: 2,
          hintStyle: TextStyle(
              fontSize: 11.0
          ),
          labelStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black87
          )
      ),
    );
  }
}
