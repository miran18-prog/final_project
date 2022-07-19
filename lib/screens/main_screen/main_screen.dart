import 'package:final_project/Home/home_page.dart';
import 'package:final_project/screens/notifications%20_screen/notfy_screen.dart';
import 'package:final_project/screens/user_Screen/user_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class MainFile extends StatefulWidget {
  const MainFile({Key? key}) : super(key: key);

  @override
  State<MainFile> createState() => _MainFileState();
}

class _MainFileState extends State<MainFile> {
  int cIndex = 0;
  List screens = <Widget>[
    UserProfileScreen(),
    const HomeScreen(),
    const NotficationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[cIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting, // Shifting
            currentIndex: cIndex,
            onTap: (index) => setState(() => cIndex = index),
            showUnselectedLabels: false,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white70,
            selectedFontSize: 10,
            unselectedFontSize: 0,
            elevation: 0,
            backgroundColor: Colors.green,
            // ignore: prefer_const_literals_to_create_immutables
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Account",
                backgroundColor: HexColor('#024959'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home",
                  backgroundColor: HexColor('#024959')),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notification",
                  backgroundColor: Colors.black),
            ]),
      ),
    );
  }
}
