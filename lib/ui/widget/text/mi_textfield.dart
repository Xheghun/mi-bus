import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class MiTextField extends StatelessWidget {
  const MiTextField({
    Key key,
    this.hint,
    this.textAlign = TextAlign.start,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  final String hint;
  final bool obscureText;
  final TextAlign textAlign;
  final TextEditingController controller;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textAlign: textAlign,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: textFieldStyle,
            focusColor: colorPrimary,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: colorPrimary)
            ),
            border: UnderlineInputBorder(borderSide: BorderSide(color: colorGrey)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12)
        ),
      ),
    );
  }
}