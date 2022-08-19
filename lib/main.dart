import 'package:final_project/app.dart';
import 'package:final_project/firebase_options.dart';
import 'package:final_project/screens/Drawbar%20Screens/job_screen.dart';
import 'package:final_project/screens/user_Screen/create_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );
  runApp(MyApp());
}
