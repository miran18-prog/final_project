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
      required this.profileStrokeWidth})
      : super(key: key);

  final String profileImage;
  final String Skils;
  final String leftElevateButtonText;
  final String rightElevateButtonText;
  final Color backcroundColor;
  final Color profileStrokeColor;
  final double profileStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Figma Flutter Generator Group4Widget - GROUP
        Container(
          width: 360,
          height: 175,
          child: Stack(
            children: [
              Positioned(
                  top: 21,
                  left: 0,
                  child: Container(
                      width: 360,
                      height: 175,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(86),
                          topRight: Radius.circular(25),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(25),
                        ),
                        color: HexColor('#e9edef'),
                      ))),
              Positioned(
                  top: 35,
                  left: 95,
                  child: Text(
                    'Miran Amanj',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: HexColor("#000010")),
                  )),
              Positioned(
                top: 65,
                left: 95,
                child: Text(
                  'Skill: Mobile application developer',
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: HexColor("#000010")),
                ),
              ),
              Positioned(
                top: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(width: 60),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0, primary: HexColor('#9ecfe7')),
                        child: Text(
                          rightElevateButtonText,
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#000010"),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 40),
                    SizedBox(
                      width: 100,
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            elevation: 0, primary: HexColor('#9ecfe7')),
                        child: Text(
                          leftElevateButtonText,
                          style: GoogleFonts.poppins(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w500,
                            color: HexColor("#000010"),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 30,
                left: 315,
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('image/star.png'),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(14, 14, 0, 0),
                    child: Text(
                      '10',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  width: 77,
                  height: 77,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 4)
                    ],
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://images.fandango.com/ImageRenderer/400/0/redesign/static/img/default_poster.png/0/images/masterrepository/performer%20images/p341391/ChrisPratt-2020.jpg'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.elliptical(77, 77)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
