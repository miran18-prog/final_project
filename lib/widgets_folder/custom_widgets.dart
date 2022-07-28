import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.borderColor,
      required this.textColor,
      required this.textFieldLabelText,
      this.h,
      this.w})
      : super(key: key);

  final Color borderColor;
  final Color textColor;
  final String textFieldLabelText;
  final double? h;
  final double? w;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: TextField(
        decoration: InputDecoration(
          labelText: textFieldLabelText,
          labelStyle: GoogleFonts.poppins(
            color: textColor,
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
