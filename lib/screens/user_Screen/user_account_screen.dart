// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      drawer: DrawerBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: StreamBuilder<DocumentSnapshot>(
            stream: DatabaseServices(uId: user.uid).getUser(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomLodingWidget();
              } else if (snapshot.hasError) {
                return Text("oops something went wrong");
              } else {
                FreelancerModel freelancerModel = FreelancerModel.fromMap(
                    snapshot.data.data() as Map<String, dynamic>);
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(freelancerModel.username,
                        style: GoogleFonts.poppins(
                            color: HexColor('#000010'),
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                    DropdownButton(
                      icon: Icon(Icons.post_add),
                      iconEnabledColor: HexColor('#000010'),
                      iconDisabledColor: HexColor('#000010'),
                      onChanged: null,
                      items: [],
                    ),
                  ],
                );
              }
            }),
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
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C'))),
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
                child: Text(
                  'Lorem anim amet aute exercitation voluptate nostrud Lorem reprehenderit nostrud. Pariatur cillum nisi pariatur et excepteur veniam qui voluptate sunt quis consequat. Reprehenderit tempor duis labore duis laboris. Veniam proident sit ad id reprehenderit enim excepteur reprehenderit id do qui. Anim fugiat irure ipsum anim ea nostrud labore irure. Excepteur proident cillum fugiat qui exercitation laboris do consectetur. Mollit exercitation nulla voluptate ea culpa tempor id excepteur ad tempor velit nisi nostrud eiusmod.',
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 149, 145, 145)),
                ),
              ),
            ),
            SizedBox(height: 50),
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
  }
}
