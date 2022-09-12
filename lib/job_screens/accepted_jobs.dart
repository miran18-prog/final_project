import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/job_screens/accepted_job_info.dart';
import 'package:final_project/job_screens/job_info.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/models/jobs_model.dart';
import 'package:final_project/screens/user_Screen/other_user/other_user_screen.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AcceptedJobs extends StatelessWidget {
  AcceptedJobs({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Accepted jobs",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: HexColor('#000010'))),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('accepted_jobs')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLodingWidget();
            } else if (snapshot.hasError) {
              print(
                snapshot.error.toString(),
              );
            } else if (snapshot.data == null) {
              return Text("You dont have new Notifications");
            }

            List<JobModel> jobsModel = snapshot.data!.docs
                .map((e) => JobModel.fromMap(e.data()))
                .toList();

            return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var job = jobsModel[index];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 375,
                    color: Color(0Xf2D9CDB),
                    child: Row(
                      children: [
                        jobsModel[index].imageUrl != null
                            ? Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                          jobsModel[index].imageUrl),
                                      fit: BoxFit.cover),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                              )
                            : Container(
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    bottomRight: Radius.circular(15),
                                  ),
                                ),
                              ),
                        SizedBox(width: 30),
                        Expanded(
                          flex: 3,
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: AutoSizeText(
                                    jobsModel[index].username,
                                    style: GoogleFonts.poppins(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w500),
                                    maxLines: 1,
                                    minFontSize: 15,
                                    maxFontSize: 20,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5),
                                  child: AutoSizeText(
                                    jobsModel[index].jobRequirment,
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400),
                                    maxLines: 1,
                                    presetFontSizes: [15, 14, 13, 12, 11, 10],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      Duration(milliseconds: 300),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    animation = CurvedAnimation(
                                        parent: animation,
                                        curve: Curves.easeInOut);
                                    return SlideTransition(
                                        position: Tween<Offset>(
                                                begin: Offset(-1, 0),
                                                end: Offset.zero)
                                            .animate(animation),
                                        child: AcceptedJobInfo(job: job));
                                  },
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return Container();
                                  },
                                ),
                              );
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
