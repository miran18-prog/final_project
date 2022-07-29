import 'package:final_project/authentication/authentication_page.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignUp.dart';
import 'package:final_project/screens/main_screen/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => MyAppState();
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Text('something went wrong try again later');
            } else if (snapshot.hasData) {
              return const MainFile();
            } else {
              return AuthPage();
            }
          },
        ),
      ),
    );
  }
}
