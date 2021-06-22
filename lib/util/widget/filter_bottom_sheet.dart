import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

void showFilterBottomSheet(BuildContext context, List<String> filterOptions) {
  var mediaQuery = MediaQuery.of(context);
  var selectedIndex = 0;
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          height: mediaQuery.size.height * 0.6,
          color: Colors.grey,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius:
                    BorderRadius.horizontal(left: radius25, right: radius25)),
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    "Lorem Ipsum",
                    style: GoogleFonts.roboto(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                Divider(),
                StatefulBuilder(
                  builder: (context, newState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        filterOptions.length,
                        (index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () => newState(() => selectedIndex = index),
                          trailing: Visibility(
                            visible: index == selectedIndex,
                            child: Icon(Icons.check, color: colorPrimary,),
                          ),
                          title: Text(filterOptions[index]),
                        ),
                      ),
                    );
                  },
                ),
                Expanded(child: SizedBox()),
                Container(
                  width: double.infinity,
                  child:  PrimaryButton(
                    showIcon: false,
                    text: "Apply",
                    padding: EdgeInsets.symmetric(vertical: 12),
                    onTap: () => Navigator.pop(context),
                  ),
                )

              ],
            ),
          ),
        );
      });
}
