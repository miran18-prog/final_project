import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class JobTile extends StatelessWidget {
  const JobTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 230,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 355,
                  height: 230,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
            top: 10,
            left: 15,
            child: CircleAvatar(
              maxRadius: 32,
              backgroundColor: Colors.green,
            ),
          ),
          Positioned(
            top: 26,
            left: 109,
            child: Text('User name',
                style: GoogleFonts.poppins(
                    fontSize: 23, fontWeight: FontWeight.w500)),
          ),
          Positioned(
              top: 101,
              left: 64,
              child: Text(
                'requiremnt:',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 125,
              left: 36,
              child: Text(
                'Social media design',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 101,
              left: 237,
              child: Text(
                'Offer:',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
          Positioned(
            top: 123,
            left: 237,
            child: Text(
              '50\$',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 45,
            top: 170,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#275ea3'),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Decline",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: HexColor('#275ea3'), width: 2),
                        primary: Colors.white,
                        elevation: 0),
                    onPressed: () {},
                    child: Text(
                      "Accept",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#275ea3')),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
