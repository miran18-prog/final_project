import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/screens/user_Screen/user_operations/create_profile_screen.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Auth {
  Future<UserCredential?> signInWithEMailAndPassword(context,
      {required String email, required String password}) async {
    try {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CustomLodingWidget(),
              ));
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      Navigator.of(context).pop();

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.of(context).pop();
        customSnackbar(context, "No user found for that email.",
            "something went wrong!'", ContentType.failure);

        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();

        customSnackbar(context, "'Wrong password provided for that user'",
            "something went wrong!'", ContentType.failure);
        print('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        Navigator.of(context).pop();
        customSnackbar(context, "Email badly formatted",
            "something went wrong!'", ContentType.failure);

        print('Email badly formatted');
      } else {
        Navigator.of(context).pop();
        customSnackbar(context, "Email badly formatted",
            "something went wrong!'", ContentType.failure);
      }

      print(e);
    }
  }

  Future<UserCredential?> signUpWithEmailAndPassword(context,
      {required String email, required String password}) async {
    try {
      showDialog(
          context: context,
          builder: (context) => Center(
                child: CustomLodingWidget(),
              ));

      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();

      DatabaseServices(uId: userCredential.user!.uid).SetUser(
          username: "Unkown",
          phoneNumber: "Unkown",
          github: "Unknown",
          twitter: "Unknown",
          facebook: "Unknown",
          instagram: "Unknown",
          linkedIn: "Unknown",
          description: "Unknown",
          is_freelancer: false,
          skill: 'Unknown',
          userId: userCredential.user!.uid);
      customSnackbar(context, "Welcome !", "Complete your registraion",
          ContentType.success);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => CreateUserScreen())));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();

        customSnackbar(context, "weak-password", "something went wrong!'",
            ContentType.failure);

        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();

        customSnackbar(context, "The account already exists for that email.",
            "something went wrong!'", ContentType.failure);

        print(
          'The account already exists for that email.',
        );
      } else if (e.code == 'invalid-email') {
        Navigator.of(context).pop();

        customSnackbar(context, "Email badly formatted",
            "something went wrong!'", ContentType.failure);

        print('Email badly formatted');
      }
    } catch (e) {
      print(e);
    }
  }
}
