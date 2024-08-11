import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextStyle extends StatelessWidget {
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final String text;
  CustomTextStyle({
    required this.fontSize,
    required this.color,
    required this.fontWeight,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
