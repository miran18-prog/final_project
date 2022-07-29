import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/app.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  //! sign in method

  signInWithEMailAndPassword(context,
      {required String email, required String password}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));

    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  signUpWithEmailAndPassword(context,
      {required String email,
      required String password,
      required String name}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                FirebaseFirestore.instance
                    .collection('users')
                    .add({'username': name})
              });
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
