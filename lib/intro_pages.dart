import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:introduction_screen/introduction_screen.dart';

class introScreens extends StatelessWidget {
  const introScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      animationDuration: 250,
      dotsDecorator: DotsDecorator(
          size: Size(10, 10),
          activeSize: Size(22, 10),
          activeColor: Color.fromARGB(255, 45, 134, 207),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      showNextButton: true,
      showDoneButton: true,
      next: Icon(
        CupertinoIcons.forward,
        color: Colors.black,
      ),
      done: Text(
        'Done',
        style: GoogleFonts.poppins(
            color: Colors.black, fontWeight: FontWeight.w500),
      ),
      onSkip: () {},
      onDone: () {},
      pages: [
        PageViewModel(
            titleWidget: Text(
              "Welcome!",
              style: TextStyle(
                fontFamily: 'fonarto',
                fontSize: 45,
                color: Colors.blue[800],
              ),
            ),
            bodyWidget: Text(
              "Hello There, are you looking for a Graphic designer ? or a developer ? but you can't find one ? ",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: HexColor('#000010'),
              ),
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'image/Asset 1.png',
              height: 350,
              width: 350,
            )),
        PageViewModel(
            titleWidget: Text(
              "Job opportunity",
              style: TextStyle(
                fontFamily: 'fonarto',
                fontSize: 40,
                color: Colors.blue[800],
              ),
            ),
            bodyWidget: Text(
              "you are a freelancer looking for a job ?",
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: HexColor('#000010')),
              textAlign: TextAlign.center,
            ),
            image: Image.asset(
              'image/Asset 1.png',
              height: 350,
              width: 350,
            )),
        PageViewModel(
          image: Image.asset(
            'image/6.png',
            height: 350,
            width: 350,
          ),
          titleWidget: Text(
            "Fast And Safe",
            style: TextStyle(
              fontFamily: 'fonarto',
              fontSize: 45,
              color: Colors.blue[800],
            ),
          ),
          bodyWidget: Text(
            "Check our app to find your needs",
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: HexColor('#000010')),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
