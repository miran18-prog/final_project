// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:email_validator/email_validator.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignUp.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Auth _auth = Auth();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    // Logo location
                    image: AssetImage("image/4.png"),
                    height: 275,
                    width: 275,
                  ),
                  CustomTextFieldForm(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter yout email';
                      }
                    },
                    controller: emailController,
                    borderColor: HexColor('#275ea3'),
                    textColor: HexColor('#275ea3'),
                    textFieldLabelText: "Email",
                    h: 43,
                    w: 300,
                  ),
                  SizedBox(height: 40),
                  CustomPasswordTextFieldForm(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'enter your password';
                      }
                    },
                    obscureText: true,
                    controller: passwordController,
                    textFieldLabelText: "Password",
                    borderColor: HexColor('#275ea3'),
                    textColor: HexColor('#275ea3'),
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
                            fontSize: 13,
                            color: HexColor('#275ea3'),
                            fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        //!forget password screen
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: HexColor('#275ea3'), elevation: 2),
                    onPressed: () {
                      setState(
                        () {
                          if (_formKey.currentState!.validate()) {
                            _auth.signInWithEMailAndPassword(context,
                                email: emailController.text.trim(),
                                password: passwordController.text.trim());
                          }
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      child: Text(
                        "Login",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  //! future update
                  // Row(children: [
                  //   Expanded(
                  //     child: Container(
                  //         margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                  //         child: Divider(
                  //           color: Colors.black,
                  //           height: 36,
                  //         )),
                  //   ),
                  //   Text("OR"),
                  //   Expanded(
                  //     child: Container(
                  //         margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                  //         child: Divider(
                  //           color: Colors.black,
                  //           height: 36,
                  //         )),
                  //   ),
                  // ]),
                  // SizedBox(
                  //   height: 18,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     GestureDetector(
                  //       child: Image.asset(
                  //         "image/facebook.png",
                  //         height: 25,
                  //         width: 25,
                  //       ),
                  //       onTap: () {},
                  //     ),
                  //     GestureDetector(
                  //       child: Image.asset(
                  //         "image/google.png",
                  //         height: 25,
                  //         width: 25,
                  //       ),
                  //       onTap: () {},
                  //     ),
                  //     GestureDetector(
                  //       child: Image.asset(
                  //         "image/twitter.png",
                  //         height: 25,
                  //         width: 25,
                  //       ),
                  //       onTap: () {},
                  //     ),
                  //   ],
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25),
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
      ),
    );
  }
}
