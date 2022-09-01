// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/models/post_model.dart';
import 'package:final_project/screens/user_Screen/post_screen.dart';
import 'package:final_project/screens/user_Screen/user_account/about_me.dart';
import 'package:final_project/screens/user_Screen/user_account/first_tab_screen.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:final_project/widgets/social_list_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with TickerProviderStateMixin {
  String? downloadUrl;

  final user = FirebaseAuth.instance.currentUser!;

  String? downloadUri;

  Future<void> downloadURLExample(String pathId) async {
    final fileName = 'post';

    downloadUri = await FirebaseStorage.instance
        .ref()
        .child("posts/${user.uid}/post/${pathId}/${fileName}")
        .getDownloadURL();

    print(downloadUri);
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return StreamBuilder<DocumentSnapshot?>(
        stream: DatabaseServices(uId: user.uid).getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CustomLodingWidget();
          } else if (snapshot.hasError) {
            return Text("Oops something went wrong try again later");
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Text("user does not have any data");
          } else if (snapshot.hasData) {
            FreelancerModel freelancerModel = FreelancerModel.fromMap(
                snapshot.data!.data() as Map<String, dynamic>);
            return Center(
              child: Column(
                children: [
                  SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7),
                    child: Container(
                      width: 400,
                      height: 145,
                      alignment: Alignment.bottomCenter,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            image: AssetImage('image/cover.jpg'),
                            opacity: 70,
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: freelancerModel.imageUrl!),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Miran Amanj',
                    style: GoogleFonts.poppins(
                        fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Mobile application developer',
                    style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey),
                  ),
                  SizedBox(height: 40),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics:
                        ClampingScrollPhysics(parent: BouncingScrollPhysics()),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              freelancerModel.github != ''
                                  ? Expanded(
                                      child: SocialWidgit(
                                        labelText: 'github',
                                        Buttonicon: FeatherIcons.github,
                                        link: freelancerModel.github!,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              freelancerModel.facebook != ''
                                  ? Expanded(
                                      child: SocialWidgit(
                                        labelText: 'facebook',
                                        Buttonicon: FeatherIcons.facebook,
                                        link: freelancerModel.facebook!,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              freelancerModel.instagram != ''
                                  ? Expanded(
                                      child: SocialWidgit(
                                        labelText: 'instagram',
                                        Buttonicon: FeatherIcons.instagram,
                                        link: freelancerModel.instagram!,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              freelancerModel.linkedIn != ''
                                  ? Expanded(
                                      child: SocialWidgit(
                                        labelText: 'linkedIn',
                                        Buttonicon: FeatherIcons.linkedin,
                                        link: freelancerModel.linkedIn!,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                              freelancerModel.twitter != ''
                                  ? Expanded(
                                      child: SocialWidgit(
                                        labelText: 'twitter',
                                        Buttonicon: FeatherIcons.twitter,
                                        link: freelancerModel.twitter!,
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                      width: 0,
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    thickness: 1,
                    color: Colors.grey[400],
                  ),
                  TabBar(
                    labelColor: HexColor('#000010'),
                    unselectedLabelColor: Colors.black38,
                    splashBorderRadius: null,
                    indicatorSize: TabBarIndicatorSize.tab,
                    physics: BouncingScrollPhysics(),
                    indicatorColor: HexColor('#275ea3'),
                    isScrollable: true,
                    controller: tabController,
                    indicator: MaterialIndicator(
                      color: HexColor('#000010'),
                    ),
                    labelStyle: GoogleFonts.poppins(),
                    // ignore: prefer_const_literals_to_create_immutables
                    tabs: [
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 75,
                          child: Text(
                            "Projects",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          alignment: Alignment.center,
                          height: 30,
                          width: 100,
                          child: Text(
                            "About me",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Expanded(
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        const FirstTabScreen(),
                        AboutMe(des: freelancerModel.description),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return CustomLodingWidget();
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
