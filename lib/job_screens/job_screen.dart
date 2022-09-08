// ignore_for_file: prefer_const_constructors

import 'package:final_project/widgets/job_tiles.dart';
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
        child: ListView.separated(
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 20);
          },
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                child: JobTile(),
              ),
            );
          },
        ),
      ),
    );
  }
}
