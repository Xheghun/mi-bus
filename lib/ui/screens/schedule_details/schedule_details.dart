import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/ui/widget/layout/base_widget.dart';

class ScheduleDetails extends StatelessWidget {

  static const routeName = "/scheduleDetails";

  const ScheduleDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      appBar: AppBar(
        leading: BackButton(),
      ),
    );
  }
}
