import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/main_screen/main_screen.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:final_project/widgets/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else if (snapshot.hasData) {
          return MainFile();
        }
        return SignInScreen();
      },
    );
  }
}