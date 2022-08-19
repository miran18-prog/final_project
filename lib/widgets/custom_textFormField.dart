import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFieldForm extends StatelessWidget {
  CustomTextFieldForm(
      {Key? key,
      required this.borderColor,
      required this.textColor,
      required this.textFieldLabelText,
      this.validator,
      this.controller,
      this.textInputType,
      this.obscureText = false,
      this.h,
      this.w})
      : super(key: key);

  TextInputType? textInputType;
  final Color borderColor;
  final Color textColor;
  final String textFieldLabelText;
  final double? h;
  final double? w;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  bool obscureText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: TextFormField(
        maxLines: 1,
        obscureText: obscureText,
        keyboardType: textInputType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.01),
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
