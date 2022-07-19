// ignore_for_file: avoid_unnecessary_containers

import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:final_project/Home/tab_pages/tab_pages..dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabControler = TabController(length: 5, vsync: this);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#024959'),
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discover",
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              DropdownButton(
                icon: const Icon(Icons.menu),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                onChanged: null,
                items: null,
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 25),
              SectionGenerator(text: 'Graphic Designer'),
              SectionGenerator(text: 'Mobile App Developer'),
            ],
          ),
        ),
      ),
    );
  }

  Widget SectionGenerator({
    required String text,
  }) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 135, 0),
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 20, color: Colors.black),
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 25),
          child: Divider(
            endIndent: 150,
            indent: 25,
            thickness: 2,
          ),
        ),
        const SizedBox(
            width: double.maxFinite, height: 267, child: GraphicDesignerPage()),
      ],
    );
  }
}
