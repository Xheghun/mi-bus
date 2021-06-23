import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/ui/widget/shape/circle.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class RouteCard extends StatelessWidget {
  const RouteCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var textStyle = GoogleFonts.poppins(fontSize: 12, color: colorGreyLight, fontWeight: FontWeight.w600);
    var titleStyle = GoogleFonts.poppins(color: colorGrey, fontWeight: FontWeight.w500);

    return Material(
      elevation: 20,
      color: Colors.white,
      shadowColor: Colors.white,
      type: MaterialType.canvas,
      borderRadius: borderRadius12,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Circle(),
                  SizedBox(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(right: BorderSide(color: colorGrey)),
                      ),
                    ),
                  ),
                  Circle()
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("From:",style: textStyle,),
                    Text("The Myriad", style: titleStyle,)
                  ],
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("To:", style: textStyle,),
                    Text("The Myriad", style: titleStyle,)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
