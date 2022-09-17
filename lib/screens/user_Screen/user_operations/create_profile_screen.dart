import 'dart:io';

import 'package:final_project/Database/database_services.dart';
import 'package:final_project/screens/Home/home_page.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:final_project/screens/main_screen/main_screen.dart';
import 'package:final_project/widgets/custom_snackbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateUserScreen extends StatefulWidget {
  CreateUserScreen({Key? key}) : super(key: key);

  @override
  State<CreateUserScreen> createState() => _CreateUserScreenState();

  bool is_selected_container1 = true;
  bool is_selected_container2 = false;
  bool is_freelancer = false;
}

class _CreateUserScreenState extends State<CreateUserScreen> {
  User user = FirebaseAuth.instance.currentUser!;
  @override
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

  Widget build(BuildContext context) {
    String choice = '';
    final _formKey = GlobalKey<FormState>();

    User user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                Text(
                  "Bdozawa",
                  style: TextStyle(
                    fontFamily: 'fonarto',
                    fontSize: 45,
                    color: Colors.blue[800],
                  ),
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your username';
                      }
                    },
                    textDirection: TextDirection.ltr,
                    controller: _usernameCtrl,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.1),
                      hintText: 'Required',
                      labelText: 'Username',
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
                ),
                SizedBox(height: 35),
                CustomTextForm(
                    labelText: 'Phone number',
                    controller: _phoneCtrl,
                    hintText: 'Opitional'),
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
                    hintText: 'Opitional'),
                SizedBox(height: 35),
                CustomTextForm(
                    labelText: 'Facebook',
                    controller: _facebookCtrl,
                    hintText: 'Opitional'),
                SizedBox(height: 35),
                CustomTextForm(
                    labelText: 'Instagram',
                    controller: _instaCtrl,
                    hintText: 'Opitional'),
                SizedBox(height: 35),
                CustomTextForm(
                  labelText: 'LinkedIn',
                  controller: _linkedInCtrl,
                  hintText: 'Opitional',
                ),
                SizedBox(height: 35),
                CustomTextForm(
                    labelText: 'Twitter',
                    controller: _twitter,
                    hintText: 'Opitional'),
                SizedBox(height: 35),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please type a description';
                      }
                    },
                    textDirection: TextDirection.ltr,
                    maxLines: 3,
                    controller: _description,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(fontSize: 0.1),
                      hintText: 'Required',
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
                  ),
                ),
                SizedBox(height: 35),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Are you a freelancer or client ? ",
                      style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 0, 140, 255),
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            if (widget.is_selected_container1 !=
                                widget.is_selected_container2) {
                              widget.is_selected_container1 =
                                  !widget.is_selected_container1;
                              if (widget.is_selected_container2 == true) {
                                widget.is_selected_container2 = false;
                              }
                            } else if (widget.is_selected_container1 ==
                                widget.is_selected_container2) {
                              widget.is_selected_container1 = true;
                            }
                          },
                        );
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: widget.is_selected_container1
                                    ? Color.fromRGBO(44, 156, 219, 0.25)
                                    : Color.fromRGBO(
                                        242, 242, 242, 0.6700000166893005),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: widget.is_selected_container1
                              ? Color.fromRGBO(45, 156, 219, 1)
                              : Color.fromRGBO(242, 242, 242, 1),
                        ),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Text(
                          "Freelancer",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: widget.is_selected_container1
                                  ? Colors.white
                                  : Color.fromRGBO(45, 156, 219, 1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.is_selected_container1 !=
                              widget.is_selected_container2) {
                            widget.is_selected_container2 =
                                !widget.is_selected_container2;
                            if (widget.is_selected_container1 == true) {
                              widget.is_selected_container1 = false;
                            }
                          } else if (widget.is_selected_container1 ==
                              widget.is_selected_container2) {
                            widget.is_selected_container2 = true;
                          }
                        });
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: widget.is_selected_container2
                                    ? Color.fromRGBO(44, 156, 219, 0.25)
                                    : Color.fromRGBO(
                                        242, 242, 242, 0.6700000166893005),
                                offset: Offset(0, 4),
                                blurRadius: 4)
                          ],
                          color: widget.is_selected_container2
                              ? Color.fromRGBO(45, 156, 219, 1)
                              : Color.fromRGBO(242, 242, 242, 1),
                        ),
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: Text(
                          "Client",
                          style: GoogleFonts.poppins(
                              fontSize: 25,
                              color: widget.is_selected_container2
                                  ? Colors.white
                                  : Color.fromRGBO(45, 156, 219, 1),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (widget.is_selected_container1 == false &&
                              widget.is_selected_container2 == false) {
                            customSnackbar(
                                context,
                                "Accounte created successfully ",
                                "Account created",
                                ContentType.success);
                          } else {
                            if (widget.is_selected_container1) {
                              choice = "Freelancer";
                            } else if (widget.is_selected_container2) {
                              choice = "Client";
                            }
                            showDialog(
                                context: context,
                                builder: ((context) => Center(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        alignment: Alignment.center,
                                        height: 200,
                                        width: 305,
                                        child: Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Are you Sure you want to be a ${choice} ?",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.poppins(
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(height: 25),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Text("Cancel"),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      if (choice ==
                                                          "Freelancer") {
                                                        widget.is_freelancer =
                                                            true;
                                                      } else if (choice ==
                                                          "Client") {
                                                        widget.is_freelancer =
                                                            false;
                                                      }
// image\avatar.jpg

                                                      DatabaseServices(
                                                              uId: user.uid)
                                                          .SetUser(
                                                        username:
                                                            _usernameCtrl.text,
                                                        phoneNumber:
                                                            _phoneCtrl.text,
                                                        github: _gitCtrl.text,
                                                        twitter: _twitter.text,
                                                        facebook:
                                                            _facebookCtrl.text,
                                                        instagram:
                                                            _instaCtrl.text,
                                                        linkedIn:
                                                            _linkedInCtrl.text,
                                                        description:
                                                            _description.text,
                                                        skill: dropdownValue,
                                                        is_freelancer: widget
                                                            .is_freelancer,
                                                        userId: FirebaseAuth
                                                            .instance
                                                            .currentUser!
                                                            .uid,
                                                      );

                                                      Navigator.of(context)
                                                          .pop();
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: ((context) =>
                                                                  MainFile())));
                                                    },
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20,
                                                          vertical: 5),
                                                      child: Text("Yes"),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )));
                          }
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 125, vertical: 15),
                        child: Text(
                          "Finish",
                          style: GoogleFonts.poppins(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 35),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {Key? key,
      this.controller,
      this.validator,
      required this.labelText,
      required this.hintText})
      : super(key: key);

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String labelText;
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
