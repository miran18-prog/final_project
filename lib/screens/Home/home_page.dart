// ignore_for_file: avoid_unnecessary_containers

import 'package:final_project/screens/Home/tab_pages/freelancer_list.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 5, vsync: this);

    return SafeArea(
      child: Scaffold(
        drawer: DrawerBar(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          shadowColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discover",
                style: GoogleFonts.poppins(
                    color: HexColor("#000010"),
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            Container(
              height: 25,
              color: Colors.transparent,
              width: double.maxFinite,
              child: TabBar(
                labelColor: HexColor('#000010'),
                unselectedLabelColor: HexColor('#4d5354'),
                physics: BouncingScrollPhysics(),
                indicatorColor: HexColor('#275ea3'),
                isScrollable: true,
                controller: tabController,
                labelPadding: EdgeInsets.symmetric(horizontal: 25),
                labelStyle: GoogleFonts.poppins(),
                // ignore: prefer_const_literals_to_create_immutables
                tabs: [
                  Text("Graphic designer", style: GoogleFonts.poppins()),
                  Text("Frontend developer", style: GoogleFonts.poppins()),
                  Text("Backend developer", style: GoogleFonts.poppins()),
                  Text("Mobile application developer",
                      style: GoogleFonts.poppins()),
                  Text("Desktop Apllication developer",
                      style: GoogleFonts.poppins()),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  GraphicDesignerPage(),
                  FrontEndDeveloper(),
                  BackEndDeveloper(),
                  MobileAppDeveloper(),
                  DesktopApplicationDeveloper(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
