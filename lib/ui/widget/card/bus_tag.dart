import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class BusTag extends StatelessWidget {
  const BusTag({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = GoogleFonts.poppins(
      fontWeight: FontWeight.w600,
      color: Colors.white,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 0,
          margin: EdgeInsets.symmetric(vertical: 15,),
          color: colorBlueGrey,
          shape: RoundedRectangleBorder(borderRadius:  borderRadius12),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.directions_bus, color: Colors.white,size: 20,),
                Container(
                    padding: EdgeInsets.all(3),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: borderRadius4,
                    ),
                    child: Text("TMD Bus 2 - Round Trip", style: textStyle.copyWith(color: colorBlueGrey, fontSize: 12),)),
                Expanded(child: SizedBox()),
                Text("12:43pm - 3:10pm", style: textStyle,)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
