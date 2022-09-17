import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/job_screens/job_info.dart';
import 'package:final_project/screens/notifications%20_screen/job_screen.dart';
import 'package:final_project/models/jobs_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class JobTile extends StatelessWidget {
  const JobTile({Key? key, required this.job}) : super(key: key);
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355,
      height: 230,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              child: Container(
                  width: 355,
                  height: 230,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ))),
          Positioned(
            top: 10,
            left: 15,
            child: job.imageUrl != null
                ? CircleAvatar(
                    maxRadius: 32,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(job.imageUrl),
                  )
                : CircleAvatar(
                    maxRadius: 32,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage('image/avatar.jpg'),
                  ),
          ),
          Positioned(
            top: 26,
            left: 109,
            child: Text('${job.username}',
                style: GoogleFonts.poppins(
                    fontSize: 23, fontWeight: FontWeight.w500)),
          ),
          Positioned(
            top: 15,
            left: 290,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => JobInfo(job: job),
                  ),
                );
              },
              icon: Icon(Icons.arrow_forward_ios),
            ),
          ),
          Positioned(
              top: 101,
              left: 64,
              child: Text(
                'requiremnt:',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 125,
              left: 36,
              child: AutoSizeText(
                job.jobRequirment,
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 13, fontWeight: FontWeight.w500),
                presetFontSizes: [15, 14, 13, 12, 11, 10],
              )),
          Positioned(
              top: 101,
              left: 237,
              child: Text(
                'Offer:',
                textAlign: TextAlign.left,
                style: GoogleFonts.poppins(
                    fontSize: 10, fontWeight: FontWeight.w500),
              )),
          Positioned(
            top: 123,
            left: 210,
            child: Text(
              '${job.offer} - IQD',
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          Positioned(
            left: 45,
            top: 170,
            child: Row(
              children: [
                SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: HexColor('#275ea3'),
                    ),
                    onPressed: () async {
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Text(
                                            "Are you Sure you want to decline this request ?",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                decoration: TextDecoration.none,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Text("Cancel"),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                final db =
                                                    FirebaseFirestore.instance;
                                                await db
                                                    .collection('users')
                                                    .doc(job.freelancerId)
                                                    .collection('jobs')
                                                    .doc(job.jobId)
                                                    .delete();
                                                Navigator.of(context).pop();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                    },
                    child: Text(
                      "Decline",
                      style: GoogleFonts.poppins(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                SizedBox(width: 50),
                SizedBox(
                  height: 40,
                  width: 110,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        side: BorderSide(color: HexColor('#275ea3'), width: 2),
                        primary: Colors.white,
                        elevation: 0),
                    onPressed: () async {
                      final db = FirebaseFirestore.instance;
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Text(
                                            "Are you Sure you want to accept this request ?",
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.poppins(
                                                decoration: TextDecoration.none,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black),
                                          ),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                child: Text("Cancel"),
                                              ),
                                            ),
                                            ElevatedButton(
                                              onPressed: () async {
                                                //  final db = FirebaseFirestore.instance;
                                                await db
                                                    .collection('users')
                                                    .doc(job.freelancerId)
                                                    .collection('accepted_jobs')
                                                    .doc(job.jobId)
                                                    .set(job.toMap());

                                                await db
                                                    .collection('users')
                                                    .doc(job.freelancerId)
                                                    .collection('jobs')
                                                    .doc(job.jobId)
                                                    .delete();

                                                Navigator.of(context).pop();
                                              },
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                    },
                    child: Text(
                      "Accept",
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: HexColor('#275ea3'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
