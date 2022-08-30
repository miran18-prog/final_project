import 'package:final_project/Database/database_services.dart';
import 'package:final_project/screens/user_Screen/create_profile_screen.dart';
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

        customSnackbar(context, 'No user found for that email.',
            'oops something went wrong!', Colors.red);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Navigator.of(context).pop();

        customSnackbar(context, 'Wrong password provided for that user',
            'oops something went wrong!', Colors.red);
        print('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        Navigator.of(context).pop();

        customSnackbar(context, 'Email badly formatted',
            'oops something went wrong!', Colors.red);
        print('Email badly formatted');
      } else {
        Navigator.of(context).pop();

        customSnackbar(
            context, e.toString(), 'oops something went wrong!', Colors.red);
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

      customSnackbar(
          context, 'Complete your registraion', 'Welcome !', Colors.green);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: ((context) => CreateUserScreen())));

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Navigator.of(context).pop();

        customSnackbar(context, 'weak-password ', 'oops something went wrong!',
            Colors.red);
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Navigator.of(context).pop();

        customSnackbar(context, 'The account already exists for that email.',
            'oops something went wrong!', Colors.red);
        print(
          'The account already exists for that email.',
        );
      } else if (e.code == 'invalid-email') {
        Navigator.of(context).pop();

        customSnackbar(context, 'Email badly formatted',
            'oops something went wrong!', Colors.red);
        print('Email badly formatted');
      }
    } catch (e) {
      Navigator.of(context).pop();

      print(e);
    }
  }

  Future Signout() async {
    await FirebaseAuth.instance.signOut();
  }

  customSnackbar(context, String text, String errorText, Color color) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        content: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: 60,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                errorText,
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
