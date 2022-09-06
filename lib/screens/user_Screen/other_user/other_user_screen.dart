// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/Home/tab_pages/freelancer_list.dart';
import 'package:final_project/screens/user_Screen/other_user/about_other_user.dart';
import 'package:final_project/screens/user_Screen/other_user/other_user_projects_screen.dart';
import 'package:final_project/screens/user_Screen/user_operations/post_screen.dart';
import 'package:final_project/screens/user_Screen/user_account/about_me.dart';
import 'package:final_project/screens/user_Screen/user_account/user_projects_tab_screen.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:final_project/widgets/social_list_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class OtherUserScreen extends StatefulWidget {
  OtherUserScreen({
    Key? key,
    required this.freelancerModel,
  }) : super(key: key);
  final FreelancerModel freelancerModel;
  @override
  State<OtherUserScreen> createState() => _OtherUserScreenState();
}

class _OtherUserScreenState extends State<OtherUserScreen>
    with TickerProviderStateMixin {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                width: 400,
                height: 145,
                alignment: Alignment.bottomCenter,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage('image/background.jpg'),
                      opacity: 70,
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: widget.freelancerModel.imageUrl != null
                    ? Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 3,
                          ),
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  widget.freelancerModel.imageUrl!),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      )
                    : Container(
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
                      ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.freelancerModel.username,
              style: GoogleFonts.poppins(
                  fontSize: 25, fontWeight: FontWeight.w500),
            ),
            Text(
              widget.freelancerModel.skill,
              style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            SizedBox(height: 40),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: ClampingScrollPhysics(parent: BouncingScrollPhysics()),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    widget.freelancerModel.facebook != ''
                        ? listButton(
                            text: 'Facebook',
                            icon: FeatherIcons.facebook,
                            backColor: Color.fromARGB(255, 90, 176, 247),
                            hight: 30,
                            width: 140,
                            textColor: Colors.white,
                            fontSize: 16,
                            socialUrl: widget.freelancerModel.facebook!,
                          )
                        : SizedBox(height: 1, width: 1),
                    SizedBox(width: 25),
                    widget.freelancerModel.github != ''
                        ? listButton(
                            text: 'Github',
                            icon: FeatherIcons.github,
                            backColor: Color.fromARGB(255, 36, 36, 36),
                            hight: 30,
                            width: 140,
                            textColor: Colors.white,
                            fontSize: 16,
                            socialUrl: widget.freelancerModel.github!,
                          )
                        : SizedBox(height: 1, width: 1),
                    SizedBox(width: 25),
                    widget.freelancerModel.instagram != ''
                        ? listButton(
                            text: 'Instagram',
                            icon: FeatherIcons.instagram,
                            backColor: Color.fromARGB(255, 254, 53, 43),
                            hight: 30,
                            width: 140,
                            textColor: Colors.white,
                            fontSize: 16,
                            socialUrl: widget.freelancerModel.github!,
                          )
                        : SizedBox(height: 1, width: 1),
                    SizedBox(width: 25),
                    widget.freelancerModel.linkedIn != ''
                        ? listButton(
                            text: 'Linkedin',
                            icon: FeatherIcons.linkedin,
                            backColor: Colors.blue,
                            hight: 30,
                            width: 140,
                            textColor: Colors.white,
                            fontSize: 16,
                            socialUrl: widget.freelancerModel.linkedIn!,
                          )
                        : SizedBox(height: 1, width: 1),
                    SizedBox(width: 25),
                    widget.freelancerModel.twitter != ''
                        ? listButton(
                            text: 'twitter',
                            icon: FeatherIcons.twitter,
                            backColor: Colors.blue,
                            hight: 30,
                            width: 140,
                            textColor: Colors.white,
                            fontSize: 16,
                            socialUrl: widget.freelancerModel.twitter!,
                          )
                        : SizedBox(height: 1, width: 1),
                    SizedBox(width: 25),
                  ],
                ),
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
                  OtherUserProjectTabScreen(
                    freelancerModel: widget.freelancerModel,
                  ),
                  AboutOtherUser(freelancer: widget.freelancerModel),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
