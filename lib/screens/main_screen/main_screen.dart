import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/notifications%20_screen/notfy_screen.dart';
import 'package:final_project/screens/user_Screen/user_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:line_icons/line_icons.dart';

class MainFile extends StatefulWidget {
  const MainFile({Key? key}) : super(key: key);

  @override
  State<MainFile> createState() => _MainFileState();
}

class _MainFileState extends State<MainFile> {
  int cIndex = 0;
  var padding = EdgeInsets.symmetric(horizontal: 18, vertical: 5);
  double gap = 10;
  List screens = <Widget>[
    UserProfileScreen(),
    const HomeScreen(),
    const NotficationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[cIndex],
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(100)),
            boxShadow: [
              BoxShadow(
                spreadRadius: -10,
                blurRadius: 60,
                color: Colors.black.withOpacity(0.4),
                offset: Offset(0, 25),
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: GNav(
            curve: Curves.fastOutSlowIn,
            duration: Duration(milliseconds: 900),
            tabs: [
              GButton(
                gap: gap,
                icon: Icons.person,
                iconColor: Colors.grey,
                iconActiveColor: HexColor('#275ea3'),
                textColor: HexColor('#275ea3'),
                text: 'Account',
                backgroundColor: HexColor('#275ea3').withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
              GButton(
                gap: gap,
                icon: LineIcons.home,
                iconColor: Colors.grey,
                iconActiveColor: HexColor('#275ea3'),
                textColor: HexColor('#275ea3'),
                text: 'Home',
                backgroundColor: HexColor('#726A95').withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
              GButton(
                gap: gap,
                icon: Icons.notifications,
                iconColor: Colors.grey,
                iconActiveColor: HexColor('#275ea3'),
                textColor: HexColor('#275ea3'),
                text: 'Notify',
                backgroundColor: Colors.teal.withOpacity(0.2),
                iconSize: 24,
                padding: padding,
              ),
            ],
            selectedIndex: cIndex,
            onTabChange: (index) {
              setState(() {
                cIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
