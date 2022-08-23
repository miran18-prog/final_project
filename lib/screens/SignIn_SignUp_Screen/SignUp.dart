import 'package:email_validator/email_validator.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/user_Screen/create_profile_screen.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController usernameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final Auth _auth = Auth();

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
                    image: AssetImage("image/5.png"),
                    height: 260,
                    width: 260,
                  ),

                  SizedBox(
                    height: 25,
                  ),
                  CustomTextFieldForm(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return ('Please enter your email');
                      } else if (!EmailValidator.validate(value)) {
                        Get.snackbar("Email error", 'Enter valid email');
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
                      if (value!.isEmpty) {
                        return 'enter yout email';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return '';
                      }
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
                      if (value!.isEmpty) {
                        return 'enter yout email';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return '';
                      }
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
                    onPressed: () async {
                      setState(() async {
                        if (_formKey.currentState!.validate()) {
                          _auth.signUpWithEmailAndPassword(context,
                              email: emailController.text.trim(),
                              password: passwordController.text.trim());
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 15),
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
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
    );
  }
}
