import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Notification", style: GoogleFonts.poppins(fontSize: 20)),
            DropdownButton(
              icon: Icon(Icons.menu),
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.white,
              onChanged: null,
              items: null,
            ),
          ],
        ),
      ),
    );
  }
}
