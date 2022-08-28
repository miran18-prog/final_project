// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);
  String? downloadUrl;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot?>(
        stream: DatabaseServices(uId: user.uid).getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("oops something went wrong");
          } else if (snapshot.hasData) {
            FreelancerModel freelancerModel = FreelancerModel.fromMap(
                snapshot.data!.data() as Map<String, dynamic>);

            return Scaffold(
              drawer: DrawerBar(),
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(freelancerModel.username,
                        style: GoogleFonts.poppins(
                            color: HexColor('#000010'),
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    IconButton(
                      icon: Icon(Icons.post_add),
                      color: Colors.black,
                      iconSize: 25,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 25),
                      child: Container(
                        height: 95,
                        width: 95,
                        decoration: BoxDecoration(
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                              blurRadius: 10,
                              color: Color.fromRGBO(128, 128, 128, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(50),
                          // image: DecorationImage(
                          //   fit: BoxFit.fill,
                          //   image: NetworkImage(downloadUrl!),
                          // ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            color: HexColor('#F4F4F4'),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '100',
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                              Text(
                                'Projects',
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
                        Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            color: HexColor('#F4F4F4'),
                            borderRadius: BorderRadius.circular(10),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '100',
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                              Text(
                                'Folowers',
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25),
                        Container(
                          height: 70,
                          width: 75,
                          decoration: BoxDecoration(
                            color: HexColor('#F4F4F4'),
                            borderRadius: BorderRadius.circular(10),
                            // ignore: prefer_const_literals_to_create_immutables
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurStyle: BlurStyle.outer,
                                  offset: Offset(0, 0),
                                  blurRadius: 1,
                                  spreadRadius: 0),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '10/10',
                                style: GoogleFonts.poppins(fontSize: 15),
                              ),
                              Text(
                                'Rating',
                                style: GoogleFonts.poppins(
                                    fontSize: 10, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: SizedBox(
                        child: AutoSizeText(
                          freelancerModel.description,
                          maxLines: 3,
                          maxFontSize: 14,
                          minFontSize: 10,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 108, 108, 108)),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        freelancerModel.github != ''
                            ? SocialWidgit(
                                labelText: 'github',
                                Buttonicon: FeatherIcons.github,
                                link: freelancerModel.github!,
                              )
                            : SizedBox(),
                        CustomSizedBox(),
                        freelancerModel.facebook != ''
                            ? SocialWidgit(
                                labelText: 'facebook',
                                Buttonicon: FeatherIcons.facebook,
                                link: freelancerModel.facebook!,
                              )
                            : SizedBox(),
                        CustomSizedBox(),
                        freelancerModel.instagram != ''
                            ? SocialWidgit(
                                labelText: 'instagram',
                                Buttonicon: FeatherIcons.instagram,
                                link: freelancerModel.instagram!,
                              )
                            : SizedBox(),
                        CustomSizedBox(),
                        freelancerModel.linkedIn != ''
                            ? SocialWidgit(
                                labelText: 'linkedIn',
                                Buttonicon: FeatherIcons.linkedin,
                                link: freelancerModel.linkedIn!,
                              )
                            : SizedBox(),
                        CustomSizedBox(),
                        freelancerModel.twitter != ''
                            ? SocialWidgit(
                                labelText: 'twitter',
                                Buttonicon: FeatherIcons.twitter,
                                link: freelancerModel.twitter!,
                              )
                            : SizedBox(),
                        CustomSizedBox(),
                      ],
                    ),
                    SizedBox(height: 5),
                    Divider(
                      thickness: 2,
                      indent: 25,
                      endIndent: 25,
                    ),
                    SizedBox(height: 20),
                    GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 150,
                          crossAxisSpacing: 3,
                          mainAxisSpacing: 3),
                      itemCount: 9,
                      itemBuilder: (context, i) => GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Text("null");
          }
        });
  }

  Widget CustomSizedBox() {
    return SizedBox(width: 15);
  }
}

class SocialWidgit extends StatelessWidget {
  Future openBrowserURL({required String url}) async {
    Uri _url = Uri.parse(url);
    final response = await http.get(_url);

    if (response.statusCode == 200) {
      if (!await launchUrl(_url, mode: LaunchMode.platformDefault)) {
        throw 'Could not launch $_url';
      }
    }
  }

  SocialWidgit(
      {Key? key,
      required this.labelText,
      required this.link,
      required this.Buttonicon})
      : super(key: key);

  final String labelText;
  String link;
  final IconData Buttonicon;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => openBrowserURL(url: link),
          icon: Icon(
            Buttonicon,
            color: Colors.blue,
            size: 35,
          ),
        ),
        SizedBox(height: 6),
        Text(
          labelText,
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w400,
              color: Color.fromARGB(255, 108, 108, 108)),
        ),
      ],
    );
  }
}
