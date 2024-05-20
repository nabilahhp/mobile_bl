import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

Color whiteColor = Color(0xFFFFFFFF);
Color yellowColor = Color(0xFFFBBC05);

Color buttonColor = Color(0xFFFBBC05);
Color buttonColorWhite = Color(0xFFFFFFFF);
Color AbuColor = Color(0xFFD8DADC);

TextStyle Poppinstyle = GoogleFonts.dmSans(
  color: whiteColor,
  fontWeight: FontWeight.w900,
);

TextStyle Interstyle = GoogleFonts.dmSans(
  color: whiteColor,
);
TextStyle Interrstyle = GoogleFonts.dmSans(
  color: AbuColor,
);
TextStyle Interrrstyle = GoogleFonts.dmSans(
  color: yellowColor,
);

FontWeight bold = FontWeight.w900;

const String tprofileimage = "lib/data/profile.png";

<<<<<<< Updated upstream
class Dimension {
  static double get screenHeight => Get.context!.height;
  static double get screenWidth => Get.context!.width;

  // Detail
  static double get popularfoodimgsize => screenHeight / 2.41;
}
=======