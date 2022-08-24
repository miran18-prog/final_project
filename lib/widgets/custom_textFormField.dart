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

  Widget build(BuildContext context) {
    return SizedBox(
      height: h,
      width: w,
      child: TextFormField(
        maxLines: 1,
        keyboardType: textInputType,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 0.1),
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

class CustomPasswordTextFieldForm extends StatefulWidget {
  CustomPasswordTextFieldForm(
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
  State<CustomPasswordTextFieldForm> createState() =>
      _CustomPasswordTextFieldFormState();
}

class _CustomPasswordTextFieldFormState
    extends State<CustomPasswordTextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.h,
      width: widget.w,
      child: TextFormField(
        maxLines: 1,
        obscureText: widget.obscureText,
        keyboardType: widget.textInputType,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              // Based on passwordVisible state choose the icon
              widget.obscureText ? Icons.visibility : Icons.visibility_off,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              // Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                widget.obscureText = !widget.obscureText;
              });
            },
          ),
          errorStyle: const TextStyle(fontSize: 0.1),
          labelText: widget.textFieldLabelText,
          labelStyle: GoogleFonts.poppins(
            color: widget.textColor,
            fontSize: 20,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 2.0),
          ),
        ),
      ),
    );
  }
}
