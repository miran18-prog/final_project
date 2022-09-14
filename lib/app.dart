import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:final_project/authentication/Authentication%20_page.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/main_screen/main_screen.dart';
import 'package:final_project/screens/user_Screen/other_user/other_user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('something went wrong try again later');
            } else if (snapshot.hasData) {
              return MainFile();
            } else {
              return SignInScreen();
            }
          },
        ),
      ),
    );
  }
}
