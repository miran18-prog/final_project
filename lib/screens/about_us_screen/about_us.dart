import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/screens/about_us_screen/about_me.dart';
import 'package:final_project/screens/about_us_screen/first_tab_screen.dart';
import 'package:final_project/widgets/social_list_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
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
                    image: DecorationImage(
                      image: AssetImage('image/my.jpg'),
                    ),
                  ),
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
              physics: ClampingScrollPhysics(parent: BouncingScrollPhysics()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: 25),
                  listButton(
                    text: 'Facebook',
                    icon: FeatherIcons.facebook,
                    backColor: Color.fromARGB(255, 90, 176, 247),
                    hight: 30,
                    width: 140,
                    textColor: Colors.white,
                    fontSize: 16,
                    socialUrl: 'https://www.facebook.com/miran.amanj.17',
                  ),
                  SizedBox(width: 25),
                  listButton(
                    text: 'Instagram',
                    icon: FeatherIcons.instagram,
                    backColor: HexColor('#e95950'),
                    hight: 30,
                    width: 160,
                    textColor: Colors.white,
                    fontSize: 16,
                    socialUrl: 'https://www.instagram.com/miran.xoshnaw/',
                  ),
                  SizedBox(width: 25),
                  listButton(
                    text: 'Twitter',
                    icon: FeatherIcons.twitter,
                    backColor: Color.fromARGB(255, 90, 176, 247),
                    hight: 30,
                    width: 135,
                    textColor: Colors.white,
                    fontSize: 16,
                    socialUrl:
                        'https://twitter.com/Miro_xoshnaw?t=wsRnOe0-7jUHum5N-Fb5_Q&s=07',
                  ),
                  SizedBox(width: 25),
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
                  const AboutMe(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
