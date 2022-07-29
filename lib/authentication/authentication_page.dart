import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  User? firebaseUser = FirebaseAuth.instance.currentUser;
// Define a widget

  @override
  Widget build(BuildContext context) {
    return is_logged() ? HomeScreen() : SignInScreen();
  }

  bool is_logged() {
    if (firebaseUser != null) {
      return true;
    } else {
      return false;
    }
  }
}
