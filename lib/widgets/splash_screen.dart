import 'dart:async';

import 'package:final_project/app.dart';
import 'package:final_project/authentication/Authentication%20_page.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => AuthPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'image/splash_screen.png',
              height: 250,
              width: 250,
            ),
            Container(
                height: 100,
                width: 100,
                child: LoadingAnimationWidget.hexagonDots(
                    color: HexColor('#275ea3'), size: 40))
          ],
        ),
      ),
    );
  }
}
