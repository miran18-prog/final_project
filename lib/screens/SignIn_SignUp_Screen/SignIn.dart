// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_project/screens/SignIn_SignUp_Screen/SignUp.dart';
import 'package:final_project/widgets_folder/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  // Logo location
                  image: AssetImage("image/1.jpg"),
                  height: 275,
                  width: 275,
                ),
                CustomTextField(
                  borderColor: HexColor("#461fb3"),
                  textColor: HexColor("#461fb3"),
                  textFieldLabelText: "Username",
                  h: 43,
                  w: 300,
                ),
                SizedBox(height: 40),
                CustomTextField(
                  textFieldLabelText: "Password",
                  borderColor: HexColor("#461fb3"),
                  textColor: HexColor("#461fb3"),
                  h: 43,
                  w: 300,
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: GestureDetector(
                      child: Text(
                        'Forgot your password ?',
                        style: GoogleFonts.poppins(
                            fontSize: 13, color: HexColor("#461fb3")),
                      ),
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => SignUpScreen()));
                      }),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.purple, elevation: 2),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 59, vertical: 13),
                    child: Text(
                      "Login",
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                  Text("OR"),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                        child: Divider(
                          color: Colors.black,
                          height: 36,
                        )),
                  ),
                ]),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        "image/facebook.png",
                        height: 25,
                        width: 25,
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "image/google.png",
                        height: 25,
                        width: 25,
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Image.asset(
                        "image/twitter.png",
                        height: 25,
                        width: 25,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: GestureDetector(
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Not a member ?",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              color: HexColor("#461fb3"),
                            ),
                          ),
                          TextSpan(
                            text: " SignUp",
                            style: GoogleFonts.poppins(
                                fontSize: 15, color: HexColor("#F07D00")),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
