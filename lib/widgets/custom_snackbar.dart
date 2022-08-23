import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

customSnackbar(context, String text, String errorText, Color color) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              errorText,
              style: GoogleFonts.poppins(fontSize: 16),
            ),
            SizedBox(height: 5),
            Text(
              text,
              style: GoogleFonts.poppins(fontSize: 12),
            ),
          ],
        ),
      ),
    ),
  );
}
