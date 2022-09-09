import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:uuid/uuid.dart';

class HireScreen extends StatelessWidget {
  const HireScreen({Key? key, required this.freelancerModel}) : super(key: key);
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    final uuid = Uuid().v1();
    final otherUserId = freelancerModel.userId;
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    String jobId = uuid;

    TextEditingController reqCtrl = TextEditingController();
    TextEditingController desCtr = TextEditingController();
    TextEditingController offerCtrl = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Send a job",
          style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: HexColor('#275EA3')),
        ),
      ),
      backgroundColor: HexColor('#ffffff'),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: StreamBuilder<DocumentSnapshot?>(
            stream: DatabaseServices(uId: currentUserId).getUser(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox();
              } else if (snapshot.hasError) {
                print(snapshot.error.toString());
              } else if (snapshot.data == null) {
                return CustomLodingWidget();
              } else if (snapshot.hasData) {
                FreelancerModel temp = FreelancerModel.fromMap(
                    snapshot.data!.data() as Map<String, dynamic>);
                return Container(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('image/vector.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      Container(
                        margin: EdgeInsets.only(right: 200),
                        child: Text(
                          "Requirments",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#275EA3')),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 339,
                        height: 53,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor('#C1C1C1'),
                                offset: Offset(0, 0),
                                blurRadius: 6)
                          ],
                          color: HexColor('#FAFAFA'),
                        ),
                        child: TextFormField(
                          controller: reqCtrl,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "fill this form";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            errorStyle: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 97, 86),
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        margin: EdgeInsets.only(right: 200),
                        child: Text(
                          "Description",
                          style: GoogleFonts.poppins(
                              fontSize: 21,
                              fontWeight: FontWeight.w400,
                              color: HexColor('#275EA3')),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 339,
                        height: 100,
                        padding: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: HexColor('#C1C1C1'),
                                offset: Offset(0, 0),
                                blurRadius: 6)
                          ],
                          color: HexColor('#FAFAFA'),
                        ),
                        child: TextFormField(
                          controller: desCtr,
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "fill this form";
                            }
                            return null;
                          }),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            errorStyle: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Color.fromARGB(255, 255, 97, 86),
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.w500),
                          ),
                          maxLines: 5,
                        ),
                      ),
                      SizedBox(height: 50),
                      Container(
                        margin: EdgeInsets.only(left: 50),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Text(
                                "Offer",
                                style: GoogleFonts.poppins(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    color: HexColor('#275EA3')),
                              ),
                            ),
                            Container(
                              width: 150,
                              height: 53,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: HexColor('#C1C1C1'),
                                      offset: Offset(0, 0),
                                      blurRadius: 6)
                                ],
                                color: HexColor('#FAFAFA'),
                              ),
                              child: TextFormField(
                                controller: offerCtrl,
                                validator: ((value) {
                                  if (value!.isEmpty) {
                                    return "fill this form";
                                  }
                                  return null;
                                }),
                                style: GoogleFonts.poppins(fontSize: 20),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  errorStyle: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 255, 97, 86),
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.w500),
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 15),
                                ),
                                maxLines: 1,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 20),
                              child: Text(
                                "IQD",
                                style: GoogleFonts.poppins(
                                    fontSize: 21,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(255, 113, 113, 113)),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 75),
                      Container(
                        height: 60,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              DatabaseServices(
                                      uId2: otherUserId, uId: currentUserId)
                                  .sendJob(
                                jobId: jobId,
                                clinetId: currentUserId,
                                freelancerId: otherUserId!,
                                jobRequirment: reqCtrl.text,
                                jobDec: desCtr.text,
                                offer: offerCtrl.text,
                                username: temp.username,
                                imageUrl: temp.imageUrl!,
                                is_finished: 'false',
                              );
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            "Hire",
                            style: GoogleFonts.poppins(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: HexColor('#275EA3'),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                );
              }
              return Text("Something went wrong");
            },
          ),
        ),
      ),
    );
  }
}
