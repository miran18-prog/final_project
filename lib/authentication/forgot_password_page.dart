import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:email_validator/email_validator.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    Auth _auth = Auth();

    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Recive an email to reset your password',
                style: GoogleFonts.poppins(
                    fontSize: 30, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              CustomTextFieldForm(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  } else if (!EmailValidator.validate(value)) {
                    customSnackbar(context, "this email is invaled!",
                        "Invaled email", ContentType.failure);
                    return 'Enter valid email';
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                borderColor: HexColor('#275ea3'),
                textColor: HexColor('#275ea3'),
                textFieldLabelText: "Email",
                h: 43,
                w: 300,
              ),
              SizedBox(height: 50),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: HexColor('#275ea3'), elevation: 2),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuth.instance.sendPasswordResetEmail(
                          email: emailController.text.trim());

                      customSnackbar(
                          context,
                          "reset link sent to your email , Check your spam folder",
                          "Link sent",
                          ContentType.help);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: ((context) => SignInScreen())));
                    }
                  },
                  icon: Icon(Icons.email),
                  label: Text(
                    "Reset password",
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
