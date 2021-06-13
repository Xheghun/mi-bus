import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class ContinueButton extends StatelessWidget {
  const ContinueButton({Key key, this.onTap, this.text = "Continue"}) : super(key: key);

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: colorPrimary,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: buttonTextButton,),
          SizedBox(width: 8,),
          Icon(Icons.arrow_right_alt)
        ],
      ),
      onPressed: onTap ?? () {},

    );
  }
}
