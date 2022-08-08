import 'dart:ffi';

import 'package:final_project/authentication/auth.dart';
import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Auth _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      image: AssetImage("image/5.png"),
                      height: 260,
                      width: 260,
                    ),

                    CustomTextFieldForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      controller: usernameController,
                      borderColor: HexColor('#275ea3'),
                      textColor: HexColor('#275ea3'),
                      textFieldLabelText: "Username",
                      h: 43,
                      w: 300,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    CustomTextFieldForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      textInputType: TextInputType.emailAddress,
                      controller: emailController,
                      borderColor: HexColor('#275ea3'),
                      textColor: HexColor('#275ea3'),
                      textFieldLabelText: "Email",
                      h: 43,
                      w: 300,
                    ),
                    SizedBox(height: 40),
                    CustomTextFieldForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          return 'make sure password fields are matching';
                        }
                        return null;
                      },
                      controller: passwordController,
                      textFieldLabelText: "Password",
                      borderColor: HexColor('#275ea3'),
                      textColor: HexColor('#275ea3'),
                      h: 43,
                      w: 300,
                    ),
                    SizedBox(height: 40),
                    CustomTextFieldForm(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill this field';
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          return 'make sure password fields are matching';
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                      textFieldLabelText: "Confirm Password",
                      borderColor: HexColor('#275ea3'),
                      textColor: HexColor('#275ea3'),
                      h: 43,
                      w: 300,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: HexColor('#275ea3'), elevation: 2),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _auth.signUpWithEmailAndPassword(context,
                              name: usernameController.text,
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 13),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                    //! future update
                    // SizedBox(
                    //   height: 25,
                    // ),
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
                      padding: const EdgeInsets.only(top: 40),
                      child: GestureDetector(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Already a member ?",
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: HexColor('#275ea3'),
                                ),
                              ),
                              TextSpan(
                                text: " SignIn",
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
                                  builder: (context) => SignInScreen()));
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
