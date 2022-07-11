import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Center(
          // ignore: prefer_const_literals_to_create_immutables
          child: Column(children: [
            const Text(
              'Bdozawa',
              style: TextStyle(fontSize: 30),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 45, vertical: 75),
              child: TextField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: HexColor("#023E73")),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  hintText: "ناوی بەکار‌هێنەر",
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
