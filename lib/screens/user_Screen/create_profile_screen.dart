import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  @override
  dynamic dropdownValue = 'Graphic Designer';
  TextEditingController _usernameCtrl = TextEditingController();
  TextEditingController _phoneCtrl = TextEditingController();
  TextEditingController _facebookCtrl = TextEditingController();
  TextEditingController _gitCtrl = TextEditingController();
  TextEditingController _instaCtrl = TextEditingController();
  TextEditingController _linkedInCtrl = TextEditingController();
  TextEditingController _twitter = TextEditingController();
  TextEditingController _description = TextEditingController();

  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Create profile",
          style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 34, 40, 47)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    print(user.uid);
                  },
                  child: Text("press")),
              SizedBox(height: 25),
              Container(
                height: 145,
                width: 145,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              SizedBox(height: 45),
              Text(
                "Update profile picture",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue),
              ),
              SizedBox(height: 45),
              Container(
                height: 50,
                width: 125,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Uploade",
                    style: GoogleFonts.poppins(fontSize: 18),
                  ),
                ),
              ),
              SizedBox(height: 60),
              CustomTextForm('Username', _usernameCtrl, 'Required'),
              SizedBox(height: 35),
              CustomTextForm('Phone number', _phoneCtrl, 'Opitional'),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: DropdownButtonFormField<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward),
                  elevation: 16,
                  style: const TextStyle(color: Colors.black),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Graphic Designer',
                    'Front-end developer',
                    'Back-end developer',
                    'Mobile application developer',
                    'Desktop application developer'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 35),
              CustomTextForm('Github', _gitCtrl, 'Opitional'),
              SizedBox(height: 35),
              CustomTextForm('Facebook', _facebookCtrl, 'Opitional'),
              SizedBox(height: 35),
              CustomTextForm('Instagram', _instaCtrl, 'Opitional'),
              SizedBox(height: 35),
              CustomTextForm(
                'LinkedIn',
                _linkedInCtrl,
                'Opitional',
              ),
              SizedBox(height: 35),
              CustomTextForm('Twitter', _twitter, 'Opitional'),
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  maxLines: 3,
                  controller: _description,
                  decoration: InputDecoration(
                    hintText: 'Required',
                    counterText: '${_description.text.length.toString()} / 200',
                    labelText: 'Description about you self',
                    hintStyle: GoogleFonts.poppins(fontSize: 15),
                    labelStyle: GoogleFonts.poppins(fontSize: 20),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 3, color: Colors.blue),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description.text = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  DatabaseServices(uId: user.uid).updateUser(
                    username: _usernameCtrl.text,
                    phoneNumber: _phoneCtrl.text,
                    github: _gitCtrl.text,
                    twitter: _twitter.text,
                    facebook: _facebookCtrl.text,
                    instagram: _instaCtrl.text,
                    linkedIn: _linkedInCtrl.text,
                    description: _description.text,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget CustomTextForm(
      String labelText, TextEditingController controller, String hintText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(fontSize: 15),
          labelStyle: GoogleFonts.poppins(fontSize: 20),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1.5, color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
