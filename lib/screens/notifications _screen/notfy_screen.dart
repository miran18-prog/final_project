import 'package:final_project/authentication/auth.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class NotficationScreen extends StatelessWidget {
  NotficationScreen({Key? key}) : super(key: key);
  Auth auth = Auth();
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
      body: ElevatedButton(
        onPressed: () async {
          auth.Signout();
        },
        child: Text('d'),
      ),
    );
  }
}
