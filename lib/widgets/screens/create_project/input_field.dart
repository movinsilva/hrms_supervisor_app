import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final controller;

  const InputField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 4,
                  color: Colors.black12,
              ),
              borderRadius: BorderRadius.circular(14),
            ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 4,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }
}
