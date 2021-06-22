import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/widget/filter_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "/homeScreen";
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_list),
        onPressed: () => showFilterBottomSheet(context,["Bus 1","Bus 2", "Bus 3"]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 9,
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  onTap: () {},
                  title: Text("Departs from The Myriad"),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.timer),
                          SizedBox(width: 5,),
                          Text("7:15 am - 7:30"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.directions_bus),
                          SizedBox(width: 5,),
                          Text("Bus 2"),
                        ],
                      )
                    ],
                  ),
                );
              },
            )
          ],
        )
      ),
    );
  }
}
