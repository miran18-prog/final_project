import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/user_Screen/user_operations/create_profile_screen.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storage;
import 'package:path/path.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class EditAccountScreen extends StatefulWidget {
  EditAccountScreen({Key? key}) : super(key: key);

  @override
  State<EditAccountScreen> createState() => _EditAccountScreenState();
}

class _EditAccountScreenState extends State<EditAccountScreen> {
  dynamic dropdownValue = 'None';
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
  bool isChanged = false;
  @override
  String? downloadUri;
  String? coverDownloadUri;
  File? _image;
  File? _coverImage;
  Future<File?> _imageCropper({required File imageFile}) async {
    CroppedFile? croppedIamge =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedIamge == null) return null;
    return File(croppedIamge.path);
  }

  Future _pickImage(ImageSource source, context) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _imageCropper(imageFile: img);
      setState(() {
        _image = img;
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future uploadFile(String file_name) async {
    if (_image == null) return;
    final fileName = file_name;
    final destination = 'users/$userId/profile_image';

    try {
      final ref = storage.FirebaseStorage.instance
          .ref()
          .child('users/$userId/profile_image_folder/${fileName}');
      await ref.putFile(_image!);

      downloadUri = await FirebaseStorage.instance
          .ref()
          .child("users/$userId/profile_image_folder/${fileName}")
          .getDownloadURL();

      DatabaseServices(uId: userId).editImageUrl(imageUrl: downloadUri!);
    } catch (e) {
      print('error occured');
    }
  }

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
        child: Center(
          child: StreamBuilder<DocumentSnapshot>(
            stream: DatabaseServices(uId: userId).getUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 250),
                      CustomLodingWidget(),
                    ],
                  ),
                );
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
                      _image == null
                          ? Container(
                              height: 145,
                              width: 145,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Color.fromARGB(255, 188, 188, 188),
                              ),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isChanged = true;
                                    });
                                    _pickImage(ImageSource.gallery, context);
                                  }),
                            )
                          : Container(
                              height: 145,
                              width: 145,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  image: DecorationImage(
                                      image: FileImage(_image!),
                                      fit: BoxFit.cover)),
                              child: IconButton(
                                  icon: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 50,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      isChanged = true;
                                    });
                                    _pickImage(ImageSource.gallery, context);
                                  }),
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
                        width: 250,
                        child: ElevatedButton(
                            onPressed: () async {
                              setState(() {
                                isChanged = false;
                              });
                              uploadFile('prof_image');
                            },
                            child: Text(
                              "Uploade",
                              style: GoogleFonts.poppins(fontSize: 18),
                            )),
                      ),
                      Text(
                        'Make sure you Uploaded your image',
                        style: GoogleFonts.poppins(color: Colors.grey),
                      ),
                      SizedBox(height: 60),
                      CustomTextForm(
                          labelText: 'Username',
                          controller: _usernameCtrl,
                          hintText: userData.username),
                      SizedBox(height: 35),
                      CustomTextForm(
                          labelText: 'Phone number',
                          controller: _phoneCtrl,
                          hintText: userData.phone_number!),
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
                            'None',
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
                      CustomTextForm(
                          labelText: 'Github',
                          controller: _gitCtrl,
                          hintText: userData.github!),
                      SizedBox(height: 35),
                      CustomTextForm(
                          labelText: 'Facebook',
                          controller: _facebookCtrl,
                          hintText: userData.facebook!),
                      SizedBox(height: 35),
                      CustomTextForm(
                          labelText: 'Instagram',
                          controller: _instaCtrl,
                          hintText: userData.instagram!),
                      SizedBox(height: 35),
                      CustomTextForm(
                        labelText: 'LinkedIn',
                        controller: _linkedInCtrl,
                        hintText: userData.linkedIn!,
                      ),
                      SizedBox(height: 35),
                      CustomTextForm(
                          labelText: 'Twitter',
                          controller: _twitter,
                          hintText: userData.twitter!),
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
                          if (!isChanged) {
                            if (userData.imageUrl != null) {
                              downloadUri = await FirebaseStorage.instance
                                  .ref()
                                  .child(
                                      "users/$userId/profile_image_folder/prof_image")
                                  .getDownloadURL();
                            } else {
                              downloadUri =
                                  'https://firebasestorage.googleapis.com/v0/b/bdozawa-application.appspot.com/o/avatar.jpg?alt=media&token=27a62b91-e770-45ab-9cb2-682c4b1f023e';
                            }
                            DatabaseServices(uId: userId).editUser(
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
                              imageUrl: downloadUri,
                            );
                            setState(() {
                              isChanged = false;
                              customSnackbar(
                                  context,
                                  "Accounte updated successfully ",
                                  "Account Updated",
                                  ContentType.success);
                            });
                          } else {
                            customSnackbar(context, "Uploade your image ",
                                "Account did not Updated", ContentType.failure);
                          }
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
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.labelText,
      required this.controller,
      required this.hintText})
      : super(key: key);
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
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
