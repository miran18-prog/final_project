import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "my name is miran amanj , i am student in salahadin university college of Science  information technology department , I participated in wecode bootcamp organized by rwanga in order to improve my skils , this is my final projecy which is an app specialized for freelancers, i hope you liked the app and if you have any suggestions or anything  i would love to contuct me",
                style: GoogleFonts.poppins(),
              ),
            ),
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('image/rwanga.png')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
