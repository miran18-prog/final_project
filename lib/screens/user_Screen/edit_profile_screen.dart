import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        child: StreamBuilder<FreelancerModel?>(
          stream: DatabaseServices(uId: userId).freelancerData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLodingWidget();
            } else if (snapshot.data == null) {
              return Text("no data");
            } else if (snapshot.hasData && snapshot.data != null) {
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
                        onPressed: () {},
                        child: Text(
                          "Uploade",
                          style: GoogleFonts.poppins(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(height: 60),
                    CustomTextForm(
                        'Username', _usernameCtrl, snapshot.data!.username),
                    SizedBox(height: 35),
                    CustomTextForm('Phone number', _phoneCtrl,
                        snapshot.data!.phone_number!),
                    SizedBox(height: 35),
                    CustomTextForm('Github', _gitCtrl, snapshot.data!.github!),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Facebook', _facebookCtrl, snapshot.data!.facebook!),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Instagram', _instaCtrl, snapshot.data!.instagram!),
                    SizedBox(height: 35),
                    CustomTextForm(
                      'LinkedIn',
                      _linkedInCtrl,
                      snapshot.data!.linkedIn!,
                    ),
                    SizedBox(height: 35),
                    CustomTextForm(
                        'Twitter', _twitter, snapshot.data!.twitter!),
                    SizedBox(height: 35),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: TextFormField(
                        maxLines: 3,
                        controller: _description,
                        decoration: InputDecoration(
                          hintText: snapshot.data!.description,
                          counterText:
                              '${_description.text.length.toString()} / 200',
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
                          setState(() {
                            _description.text = value;
                          });
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
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 140, vertical: 15),
                        child: Text("Save"),
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
