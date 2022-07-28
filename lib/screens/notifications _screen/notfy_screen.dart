import 'package:final_project/screens/main_screen/DrawerBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Notification",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: HexColor('#000010'))),
          ],
        ),
      ),
    );
  }
}
