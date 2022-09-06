import 'package:auto_size_text/auto_size_text.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutOtherUser extends StatelessWidget {
  AboutOtherUser({Key? key, required this.freelancer}) : super(key: key);
  final FreelancerModel freelancer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: AutoSizeText(
                  freelancer.description,
                  presetFontSizes: [
                    20,
                    19,
                    18,
                    17,
                    16,
                  ],
                  style: GoogleFonts.poppins(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
