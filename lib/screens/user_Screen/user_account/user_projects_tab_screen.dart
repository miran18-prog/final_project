import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/models/post_model.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsTabScreen extends StatelessWidget {
  const ProjectsTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: DatabaseServices(uId: user.uid).getUserPosts(),
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

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                  ),
                  itemCount: postModel.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(3),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(postModel[index].imageUrl!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}

// ListView.builder(
//                 itemCount: snapshot.data!.docs.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       children: [
//                         Container(
//                           decoration: const BoxDecoration(
//                             color: Color.fromARGB(255, 243, 250, 255),
//                             borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(25),
//                                 bottomRight: Radius.circular(25)),
//                           ),
//                           child: Row(
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   height: 125,
//                                   width: 125,
//                                   decoration: BoxDecoration(
//                                     image: DecorationImage(
//                                         image: NetworkImage(
//                                             postModel[index].imageUrl!),
//                                         fit: BoxFit.cover),
//                                     borderRadius: BorderRadius.only(
//                                         topRight: Radius.circular(25),
//                                         bottomRight: Radius.circular(25)),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: Column(
//                                   children: [
//                                     AutoSizeText(
//                                       postModel[index].postTitle!,
//                                       presetFontSizes: [
//                                         16,
//                                         15,
//                                         14,
//                                         13,
//                                         12,
//                                         11,
//                                         10
//                                       ],
//                                       textAlign: TextAlign.center,
//                                       style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w500),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               IconButton(
//                                 onPressed: () async {
//                                   showDialog(
//                                       context: context,
//                                       builder: ((context) => Center(
//                                             child: Container(
//                                               decoration: BoxDecoration(
//                                                   color: Colors.white,
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           25)),
//                                               alignment: Alignment.center,
//                                               height: 200,
//                                               width: 305,
//                                               child: Center(
//                                                 child: Column(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.center,
//                                                   children: [
//                                                     Padding(
//                                                       padding:
//                                                           const EdgeInsets.all(
//                                                               15),
//                                                       child: Text(
//                                                         "Are you Sure you want to delete this post ?",
//                                                         textAlign:
//                                                             TextAlign.center,
//                                                         style:
//                                                             GoogleFonts.poppins(
//                                                                 decoration:
//                                                                     TextDecoration
//                                                                         .none,
//                                                                 fontSize: 18,
//                                                                 fontWeight:
//                                                                     FontWeight
//                                                                         .w500,
//                                                                 color: Colors
//                                                                     .black),
//                                                       ),
//                                                     ),
//                                                     SizedBox(height: 25),
//                                                     Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .spaceEvenly,
//                                                       children: [
//                                                         ElevatedButton(
//                                                           onPressed: () {
//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop();
//                                                           },
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         20,
//                                                                     vertical:
//                                                                         5),
//                                                             child:
//                                                                 Text("Cancel"),
//                                                           ),
//                                                         ),
//                                                         ElevatedButton(
//                                                           onPressed: () async {
//                                                             final db =
//                                                                 FirebaseFirestore
//                                                                     .instance;

//                                                             await db
//                                                                 .collection(
//                                                                     'users')
//                                                                 .doc(user.uid)
//                                                                 .collection(
//                                                                     'posts')
//                                                                 .doc(postModel[
//                                                                         index]
//                                                                     .imagePathId)
//                                                                 .delete();

//                                                             Reference
//                                                                 storageRef =
//                                                                 await FirebaseStorage
//                                                                     .instance
//                                                                     .refFromURL(
//                                                                         postModel[index]
//                                                                             .imageUrl!);
//                                                             print(storageRef
//                                                                 .fullPath);
//                                                             await storageRef
//                                                                 .delete();

//                                                             Navigator.of(
//                                                                     context)
//                                                                 .pop();
//                                                           },
//                                                           child: Padding(
//                                                             padding:
//                                                                 const EdgeInsets
//                                                                         .symmetric(
//                                                                     horizontal:
//                                                                         20,
//                                                                     vertical:
//                                                                         5),
//                                                             child: Text("Yes"),
//                                                           ),
//                                                         ),
//                                                       ],
//                                                     )
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           )));
//                                 },
//                                 icon: Icon(Icons.delete),
//                               )
//                             ],
//                           ),
//                         ),
//                         const SizedBox(height: 25),
//                       ],
//                     ),
//                   );
//                 },
//               );