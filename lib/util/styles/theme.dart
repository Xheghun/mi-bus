import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myriad_bus_scheduler/util/styles/colors.dart';

class AppTheme {
  static ThemeData main() {
    return ThemeData(
      primaryColor: colorPrimary,
      accentColor: colorSecondary,
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorPrimary,
      ),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: GoogleFonts.poppins().fontFamily,
      focusColor: colorPrimary,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 20,
      ),
    );
  }
}
