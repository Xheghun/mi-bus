import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/core/models/bus_stop.dart';
import 'package:myriad_bus_scheduler/ui/widget/buttons/primary_button.dart';
import 'package:myriad_bus_scheduler/ui/widget/card/bus_tag.dart';
import 'package:myriad_bus_scheduler/ui/widget/card/route_card.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';
import 'package:myriad_bus_scheduler/ui/widget/shape/circle.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';
import 'package:myriad_bus_scheduler/util/styles/style.dart';

class ScheduleDetails extends StatelessWidget {

  static const routeName = "/scheduleDetails";

  const ScheduleDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black,),
      ),
      body: Column(
        children: [
          RouteCard(),
          BusTag(),
          Expanded(
            child: ListView.builder(
              itemCount: BusStop.sampleStops().length,
              itemBuilder: (context, index) {
                var busStop = BusStop.sampleStops()[index];
                var lastIndex = BusStop.sampleStops().length -1;

                BorderRadius borderRadius() {
                  if(index == 0)
                    return BorderRadius.vertical(top: radius25);
                  else if (index == lastIndex)
                    return BorderRadius.vertical(bottom: radius25);

                  return BorderRadius.zero;
                }

                getAlign() {
                  if(index == 0)
                    return CrossAxisAlignment.start;
                  else if(index == lastIndex)
                    return CrossAxisAlignment.end;

                  return CrossAxisAlignment.center;
                }

                getIndicatorAlign() {
                  if(index == 0)
                    return Alignment.topCenter;
                  else if(index == lastIndex)
                    return Alignment.bottomCenter;

                  return Alignment.center;
                }

                Widget icon() {
                  if(index == 0 || index == lastIndex)
                    return Icon(Icons.location_on_outlined, color: colorBlueGrey, size: 25,);
                  return Icon(Icons.directions_bus, color: colorBlueGrey,size: 25,);
                }

                return Row(
                  crossAxisAlignment: getAlign(),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: icon(),
                    ),
                    Container(
                      alignment: getIndicatorAlign(),
                      height: 80,
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 5),
                      child: Circle(color: Colors.white,size: 6,),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: borderRadius()
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(busStop.name, style: GoogleFonts.poppins(fontWeight: FontWeight.w600),),
                          Text(busStop.time, style: GoogleFonts.poppins(color: colorBlueGrey, fontSize: 12),)
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            width: double.infinity,
            child: PrimaryButton(
              showIcon: false,
              text: "Set Reminder",
              padding: EdgeInsets.symmetric(vertical: 15),
            ),
          )
        ],
      ),
    );
  }
}
