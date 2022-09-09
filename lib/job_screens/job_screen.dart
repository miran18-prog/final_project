// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/jobs_model.dart';
import 'package:final_project/widgets/job_tiles.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Text(
          "Jobs Available",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(115, 152, 207, 1),
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          // ignore: unnecessary_const
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(115, 152, 207, 1),
              Color.fromRGBO(165, 205, 255, 0),
            ],
          ),
        ),
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .collection('jobs')
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLodingWidget();
            } else if (snapshot.hasError) {
              Text("Ooops something went wrong! try again later.");
              print(snapshot.error.toString());
            } else if (snapshot.data == null) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "You don't have any jobs.",
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              );
            }

            List<JobModel> jobs = snapshot.data!.docs
                .map(
                  (e) => JobModel.fromMap(
                    e.data(),
                  ),
                )
                .toList();

            return Container(
              child: ListView.separated(
                itemCount: jobs.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20);
                },
                itemBuilder: (BuildContext context, int index) {
                  JobModel job = jobs[index];

                  return Center(
                    child: Container(
                      child: JobTile(job: job),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
