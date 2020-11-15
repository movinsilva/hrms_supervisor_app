import 'package:flutter/material.dart';

class InputFormFieldSizes extends StatelessWidget {

  // this will store the value for the controller
  // this is provided by the constructor
  // use this to get the current details of the form field
  final controller;

  // this will decide the keyboard type of the input
  // field
  final keyboardType;

  final maxLines;
  final maxNo;

  const InputFormFieldSizes({Key key, this.controller, this.keyboardType, this.maxLines, this.maxNo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxNo,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.blue[200],
                width: 2
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 4,
                color: Colors.grey[300]
            ),
            borderRadius: BorderRadius.circular(14),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
      ),
    );
  }
}
