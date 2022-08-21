import 'dart:js';

import 'package:final_project/Database/database_services.dart';
import 'package:final_project/screens/user_Screen/create_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth {
  Future<UserCredential?> signInWithEMailAndPassword(context,
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        customSnackbar(context, 'No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        customSnackbar(context, 'Wrong password provided for that user');
        print('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        customSnackbar(context, 'Email badly formatted');
        print('Email badly formatted');
      } else
        customSnackbar(context, e.toString());

      print(e);
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(context,
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      DatabaseServices(uId: userCredential.user!.uid).updateUser(
          username: "Unkown",
          phoneNumber: "Unkown",
          github: "Unkown",
          twitter: "Unkown",
          facebook: "Unkown",
          instagram: "Unkown",
          linkedIn: "Unkown",
          description: "Unkown",
          is_freelancer: false);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        customSnackbar(context, 'weak-password ');
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        customSnackbar(context, 'The account already exists for that email.');
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        customSnackbar(context, 'Email badly formatted');
        print('Email badly formatted');
      }
    } catch (e) {
      print(e);
    }
  }

  Future Signout() async {
    await FirebaseAuth.instance.signOut();
  }

  customSnackbar(context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'oops something went wrong!',
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                text,
                style: GoogleFonts.poppins(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
