import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static const Color greyColor = Color(0xFF79828B);
  static const Color blackColor = Color(0xFF42505C);

  /// lightMode
  static ThemeData lightMode = ThemeData(
    /// Scaffold
    scaffoldBackgroundColor: Colors.transparent,

    /// AppBarTheme
    appBarTheme: AppBarTheme(
      titleTextStyle: GoogleFonts.getFont(
        "Poppins",
        color: Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 22,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30)),
      ),
      backgroundColor: const Color(0xFF39A552),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
    ),

    /// textTheme
    textTheme: TextTheme(
      titleSmall: GoogleFonts.getFont(
        "Poppins",
      ),
    ),
  );
}
