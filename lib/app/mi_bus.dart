import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/app/route_generator.dart';
import 'package:myriad_bus_scheduler/util/styles/theme.dart';

class MiBus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.main(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
