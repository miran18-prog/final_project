import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class EditAccountScreen extends StatefulWidget {
  EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
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
  String userId = FirebaseAuth.instance.currentUser!.uid;
  bool is_freelancer = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Edit profile",
          style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 34, 40, 47)),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: DatabaseServices(uId: userId).getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLodingWidget();
            } else if (snapshot.data == null) {
              return Text("no data");
            } else if (snapshot.hasData && snapshot.data != null) {
              FreelancerModel userData = FreelancerModel.fromMap(
                  snapshot.data!.data() as Map<String, dynamic>);

              _usernameCtrl.text = userData.username;
              _phoneCtrl.text = userData.phone_number!;
              _facebookCtrl.text = userData.facebook!;
              _gitCtrl.text = userData.github!;
              _instaCtrl.text = userData.instagram!;
              _linkedInCtrl.text = userData.linkedIn!;
              _twitter.text = userData.twitter!;
              _description.text = userData.description;
              dropdownValue = userData.skill;
              is_freelancer = userData.is_freelancer!;
              return Center(
                child: Column(
                  children: [
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
                        onPressed: () {
                          File? _photo;
                          final ImagePicker _picker = ImagePicker();
                        },
                        child: Text(
                          "Uploade",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    CustomTextForm(
                        'Username', _usernameCtrl, userData.username),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Phone number', _phoneCtrl, userData.phone_number!),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: DropdownButtonFormField<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? newValue) {
                          dropdownValue = newValue!;
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
                    CustomTextForm('Github', _gitCtrl, userData.github!),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Facebook', _facebookCtrl, userData.facebook!),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Instagram', _instaCtrl, userData.instagram!),
                    SizedBox(height: 35),
                    CustomTextForm(
                      'LinkedIn',
                      _linkedInCtrl,
                      userData.linkedIn!,
                    ),
                    SizedBox(height: 35),
                    CustomTextForm('Twitter', _twitter, userData.twitter!),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        maxLines: 3,
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: userData.description,
                          labelText: 'Description about you self',
                          hintStyle: GoogleFonts.poppins(fontSize: 15),
                          labelStyle: GoogleFonts.poppins(fontSize: 20),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.5, color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 3, color: Colors.blue),
                          ),
                        ),
                        onChanged: (value) {
                          _description.text = value;
                        },
                      ),
                    ),
                    SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () async {
                        DatabaseServices(
                                uId: FirebaseAuth.instance.currentUser!.uid)
                            .updateUser(
                          username: _usernameCtrl.text,
                          phoneNumber: _phoneCtrl.text,
                          github: _gitCtrl.text,
                          twitter: _twitter.text,
                          facebook: _facebookCtrl.text,
                          instagram: _instaCtrl.text,
                          linkedIn: _linkedInCtrl.text,
                          description: _description.text,
                          skill: dropdownValue,
                          is_freelancer: is_freelancer,
                          userId: FirebaseAuth.instance.currentUser!.uid,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 140, vertical: 20),
                        child: Text(
                          "Save",
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              );
            }
            return Text(snapshot.error.toString());
          },
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
