import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/custom_card.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';

class GraphicDesignerPage extends StatefulWidget {
  const GraphicDesignerPage({Key? key}) : super(key: key);

  @override
  State<GraphicDesignerPage> createState() => _GraphicDesignerPageState();
}

class _GraphicDesignerPageState extends State<GraphicDesignerPage> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('skill', isEqualTo: 'Graphic Designer')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.data == null) {
            return CustomLodingWidget();
          } else if (snapshot.hasData) {
            List<FreelancerModel> _freelancers = snapshot.data!.docs
                .map(
                  (e) => FreelancerModel.fromMap(
                    e.data(),
                  ),
                )
                .toList();

            return ListView.builder(
              itemCount: _freelancers.length,
              itemBuilder: (BuildContext context, int index) {
                List<String> usersId = [];

                FreelancerModel freelancer = _freelancers[index];

                usersId.add(_freelancers[index].userId!);
                int userIndex = index;
                return Column(
                  children: [
                    SizedBox(
                      height: 33,
                    ),
                    Center(
                      child: CardWidget(
                        freelancerModel: freelancer,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                );
              },
            );
          }
          return CustomLodingWidget();
        },
      ),
    );
  }
}

class MobileAppDeveloper extends StatefulWidget {
  const MobileAppDeveloper({Key? key}) : super(key: key);

  @override
  State<MobileAppDeveloper> createState() => MobileAppDeveloperState();
}

class MobileAppDeveloperState extends State<MobileAppDeveloper> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where(
            'skill',
            isEqualTo: 'Mobile application developer',
          )
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text("Oops something went wrong try again later!"));
        } else if (snapshot.data == null) {
          return CustomLodingWidget();
        } else if (snapshot.hasData) {
          List<FreelancerModel> _freelancers = snapshot.data!.docs
              .map(
                (e) => FreelancerModel.fromMap(
                  e.data(),
                ),
              )
              .toList();
          return ListView.builder(
            itemCount: _freelancers.length,
            itemBuilder: (BuildContext context, int index) {
              FreelancerModel freelancer = _freelancers[index];
              List<String> usersId = [];

              usersId.add(_freelancers[index].userId!);
              int userIndex = index;

              return Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Center(
                    child: CardWidget(
                      freelancerModel: freelancer,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                ],
              );
            },
          );
        }
        return CustomLodingWidget();
      },
    ));
  }
}

class FrontEndDeveloper extends StatelessWidget {
  const FrontEndDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where(
            'skill',
            isEqualTo: 'Front-end developer',
          )
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text("Oops something went wrong try again later!"));
        } else if (snapshot.data == null) {
          return CustomLodingWidget();
        } else if (snapshot.hasData) {
          List<FreelancerModel> _freelancers = snapshot.data!.docs
              .map(
                (e) => FreelancerModel.fromMap(
                  e.data(),
                ),
              )
              .toList();
          return ListView.builder(
            itemCount: _freelancers.length,
            itemBuilder: (BuildContext context, int index) {
              FreelancerModel freelancer = _freelancers[index];
              List<String> usersId = [];

              usersId.add(_freelancers[index].userId!);
              int userIndex = index;

              return Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Center(
                    child: CardWidget(
                      freelancerModel: freelancer,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                ],
              );
            },
          );
        }
        return CustomLodingWidget();
      },
    ));
  }
}

class BackEndDeveloper extends StatelessWidget {
  const BackEndDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .where(
            'skill',
            isEqualTo: 'Back-end developer',
          )
          .snapshots(),
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasError) {
          return Center(
              child: Text("Oops something went wrong try again later!"));
        } else if (snapshot.data == null) {
          return CustomLodingWidget();
        } else if (snapshot.hasData) {
          List<FreelancerModel> _freelancers = snapshot.data!.docs
              .map(
                (e) => FreelancerModel.fromMap(
                  e.data(),
                ),
              )
              .toList();
          return ListView.builder(
            itemCount: _freelancers.length,
            itemBuilder: (BuildContext context, int index) {
              FreelancerModel freelancer = _freelancers[index];
              List<String> usersId = [];

              usersId.add(_freelancers[index].userId!);
              int userIndex = index;

              return Column(
                children: [
                  SizedBox(
                    height: 33,
                  ),
                  Center(
                    child: CardWidget(
                      freelancerModel: freelancer,
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                ],
              );
            },
          );
        }
        return CustomLodingWidget();
      },
    ));
  }
}

class DesktopApplicationDeveloper extends StatelessWidget {
  const DesktopApplicationDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('skill', isEqualTo: 'Desktop application developer')
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return Center(
                child: Text("Oops something went wrong try again later!"));
          } else if (snapshot.data == null) {
            return CustomLodingWidget();
          } else if (snapshot.hasData) {
            List<FreelancerModel> _freelancers = snapshot.data!.docs
                .map(
                  (e) => FreelancerModel.fromMap(
                    e.data(),
                  ),
                )
                .toList();
            return ListView.builder(
              itemCount: _freelancers.length,
              itemBuilder: (BuildContext context, int index) {
                FreelancerModel freelancer = _freelancers[index];
                List<String> usersId = [];

                usersId.add(_freelancers[index].userId!);
                int userIndex = index;

                return Column(
                  children: [
                    SizedBox(
                      height: 33,
                    ),
                    Center(
                      child: CardWidget(
                        freelancerModel: freelancer,
                      ),
                    ),
                    SizedBox(
                      height: 13,
                    ),
                  ],
                );
              },
            );
          }
          return CustomLodingWidget();
        },
      ),
    );
  }
}
