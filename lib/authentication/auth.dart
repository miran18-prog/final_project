import 'package:final_project/Database/database_services.dart';
import 'package:final_project/screens/user_Screen/create_profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class Auth {
  Future<UserCredential> signInWithEMailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);

    return userCredential;
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    if (userCredential.user?.uid == null) {
      print("nu user ");
    }

    DatabaseServices(uId: userCredential.user!.uid).updateUser(
        username: "Unkown",
        phoneNumber: "Unkown",
        github: "Unkown",
        twitter: "Unkown",
        facebook: "Unkown",
        instagram: "Unkown",
        linkedIn: "Unkown",
        description: "Unkown",
        createdAt: DateTime.now());

    return userCredential;
  }

  Future Signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
