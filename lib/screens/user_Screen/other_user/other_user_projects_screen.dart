import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/models/post_model.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class OtherUserProjectTabScreen extends StatelessWidget {
  OtherUserProjectTabScreen({Key? key, required this.freelancerModel})
      : super(key: key);
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: DatabaseServices(uId: freelancerModel.userId).getUserPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CustomLodingWidget();
            } else if (snapshot.hasError) {
              return const Text("oops something went wrong try again later");
            } else if (snapshot.data == null || !snapshot.hasData) {
              return Text(
                "User does not posted any projectes",
                style: GoogleFonts.poppins(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              );
            } else {
              List<PostModel> postModel = snapshot.data!.docs
                  .map(
                    (e) => PostModel.fromMap(
                      e.data(),
                    ),
                  )
                  .toList();

              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 243, 250, 255),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(25),
                                bottomRight: Radius.circular(25)),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 125,
                                  width: 125,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            postModel[index].imageUrl!),
                                        fit: BoxFit.cover),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomRight: Radius.circular(25)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    AutoSizeText(
                                      postModel[index].postTitle!,
                                      presetFontSizes: [
                                        16,
                                        15,
                                        14,
                                        13,
                                        12,
                                        11,
                                        10
                                      ],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 25),
                      ],
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
