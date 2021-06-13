import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class MiTextField extends StatelessWidget {
  const MiTextField({
    Key key,
    this.hint,
    this.obscureText = false,
  }) : super(key: key);

  final String hint;
  final bool obscureText;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText,
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