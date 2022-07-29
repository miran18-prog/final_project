// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:final_project/widgets/DrawerBar.dart';
import 'package:final_project/widgets/custom_textFormField.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerBar(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Username",
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
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 30,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: HexColor('#275ea3'), elevation: 0),
                        child: Text(
                          'Follow',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
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
                  SizedBox(width: 25),
                  Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      height: 30,
                      width: 75,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            primary: HexColor('#275ea3'), elevation: 0),
                        child: Text(
                          'Rate',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
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
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 40,
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: HexColor('#275ea3'), elevation: 0),
                      child: Text(
                        'Hire',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 110,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          side:
                              BorderSide(color: HexColor('#275ea3'), width: 2),
                          primary: Colors.white,
                          elevation: 0),
                      child: Text(
                        'Message',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: HexColor('#275ea3'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            Divider(
              indent: 25,
              endIndent: 25,
            ),
            GridView.builder(
              physics: ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 3),
              itemCount: mockData.length,
              itemBuilder: (context, i) => GestureDetector(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        mockData[i]['url'].toString(),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List mockData = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796"
    },
    {
      "albumId": 1,
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "url": "https://via.placeholder.com/600/24f355",
      "thumbnailUrl": "https://via.placeholder.com/150/24f355"
    },
    {
      "albumId": 1,
      "id": 4,
      "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
      "url": "https://via.placeholder.com/600/d32776",
      "thumbnailUrl": "https://via.placeholder.com/150/d32776"
    },
    {
      "albumId": 1,
      "id": 5,
      "title": "natus nisi omnis corporis facere molestiae rerum in",
      "url": "https://via.placeholder.com/600/f66b97",
      "thumbnailUrl": "https://via.placeholder.com/150/f66b97"
    },
    {
      "albumId": 1,
      "id": 6,
      "title": "accusamus ea aliquid et amet sequi nemo",
      "url": "https://via.placeholder.com/600/56a8c2",
      "thumbnailUrl": "https://via.placeholder.com/150/56a8c2"
    },
    {
      "albumId": 1,
      "id": 7,
      "title":
          "officia delectus consequatur vero aut veniam explicabo molestias",
      "url": "https://via.placeholder.com/600/b0f7cc",
      "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc"
    },
    {
      "albumId": 1,
      "id": 8,
      "title": "aut porro officiis laborum odit ea laudantium corporis",
      "url": "https://via.placeholder.com/600/54176f",
      "thumbnailUrl": "https://via.placeholder.com/150/54176f"
    },
    {
      "albumId": 1,
      "id": 9,
      "title": "qui eius qui autem sed",
      "url": "https://via.placeholder.com/600/51aa97",
      "thumbnailUrl": "https://via.placeholder.com/150/51aa97"
    },
  ];
}
