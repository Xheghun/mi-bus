import 'package:flutter/material.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';

class AppTheme {
  ThemeData main() {
    return ThemeData(
      primaryColor: colorPrimary,
      accentColor: colorSecondary,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
