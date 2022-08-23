import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckIsFreelancerOrClinet extends StatefulWidget {
  CheckIsFreelancerOrClinet({Key? key}) : super(key: key);

  @override
  State<CheckIsFreelancerOrClinet> createState() =>
      _CheckIsFreelancerOrClinetState();

  bool is_selected_container1 = true;
  bool is_selected_container2 = false;
}

class _CheckIsFreelancerOrClinetState extends State<CheckIsFreelancerOrClinet> {
  @override
  Widget build(BuildContext context) {
    String choice = '';
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
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
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: widget.is_selected_container1
                            ? Color.fromRGBO(44, 156, 219, 0.25)
                            : Color.fromRGBO(242, 242, 242, 0.6700000166893005),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ],
                  color: widget.is_selected_container1
                      ? Color.fromRGBO(45, 156, 219, 1)
                      : Color.fromRGBO(242, 242, 242, 1),
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Text(
                  "Freelancer",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
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
                width: 250,
                height: 75,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: widget.is_selected_container2
                            ? Color.fromRGBO(44, 156, 219, 0.25)
                            : Color.fromRGBO(242, 242, 242, 0.6700000166893005),
                        offset: Offset(0, 4),
                        blurRadius: 4)
                  ],
                  color: widget.is_selected_container2
                      ? Color.fromRGBO(45, 156, 219, 1)
                      : Color.fromRGBO(242, 242, 242, 1),
                ),
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                child: Text(
                  "Client",
                  style: GoogleFonts.poppins(
                      fontSize: 30,
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
                if (widget.is_selected_container1 == false &&
                    widget.is_selected_container2 == false) {
                  customSnackbar(context,
                      text: 'please choose one of the choices',
                      errorText: 'oops something went wrong',
                      color: Colors.red);
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
                                  borderRadius: BorderRadius.circular(25)),
                              alignment: Alignment.center,
                              height: 200,
                              width: 305,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Are you Sure you want to be a ${choice} ?",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(height: 25),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
                                            child: Text("Cancel"),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 5),
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
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 125, vertical: 15),
                child: Text(
                  "Finish",
                  style: GoogleFonts.poppins(
                      fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: 35),
          ],
        ),
      ),
    );
  }
}

customSnackbar(context,
    {required String text, required String errorText, required Color color}) {
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
