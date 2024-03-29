import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project/models/jobs_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class JobInfo extends StatelessWidget {
  const JobInfo({Key? key, required this.job}) : super(key: key);
  final JobModel job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          " Job information",
          style: GoogleFonts.poppins(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: HexColor('#275EA3')),
        ),
      ),
      backgroundColor: HexColor('#ffffff'),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/vector2.png'),
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
                alignment: Alignment.centerLeft,
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
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: AutoSizeText(
                    job.jobRequirment,
                    textAlign: TextAlign.left,
                    presetFontSizes: [23, 22, 21, 20, 19, 18, 17, 16, 15],
                    style: GoogleFonts.poppins(),
                    maxLines: 1,
                  ),
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
                      alignment: Alignment.centerLeft,
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
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: AutoSizeText(
                          job.offer,
                          textAlign: TextAlign.left,
                          presetFontSizes: [23, 22, 21, 20, 19, 18, 17, 16, 15],
                          style: GoogleFonts.poppins(),
                          maxLines: 1,
                        ),
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
              SizedBox(height: 50),
              Container(
                child: Text(
                  "Description",
                  style: GoogleFonts.poppins(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: HexColor('#275EA3')),
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: 339,
                height: 260,
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
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 1, 10, 5),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      AutoSizeText(
                        job.jobDec,
                        presetFontSizes: [20, 19, 18, 17, 16, 15],
                        style: GoogleFonts.poppins(),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 75),
            ],
          ),
        ),
      ),
    );
  }
}
