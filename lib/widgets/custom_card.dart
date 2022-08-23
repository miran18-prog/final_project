// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.profileImage,
      required this.Skils,
      required this.leftElevateButtonText,
      required this.rightElevateButtonText,
      required this.backcroundColor,
      required this.profileStrokeColor,
      required this.profileStrokeWidth,
      required this.usernName})
      : super(key: key);

  final String profileImage;
  final String Skils;
  final String leftElevateButtonText;
  final String rightElevateButtonText;
  final Color backcroundColor;
  final Color profileStrokeColor;
  final double profileStrokeWidth;
  final String usernName;

  @override
  Widget build(BuildContext context) {
    return Text("f");
  }
}
