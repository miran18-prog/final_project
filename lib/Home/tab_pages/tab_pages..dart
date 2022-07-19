import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphicDesignerPage extends StatefulWidget {
  const GraphicDesignerPage({Key? key}) : super(key: key);

  @override
  State<GraphicDesignerPage> createState() => _GraphicDesignerPageState();
}

class _GraphicDesignerPageState extends State<GraphicDesignerPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 4,
      itemBuilder: ((context, index) {
        return const CardWidget(
          profileImage:
              'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
          profileStrokeWidth: 2,
          Skils: 'Mobile App Developer - Frontend Developer - Graphic Designer',
          profileStrokeColor: Color.fromARGB(255, 255, 232, 232),
          leftElevateButtonText: 'Profile',
          rightElevateButtonText: 'Shortlist',
          backcroundColor: Color.fromARGB(255, 255, 232, 232),
        );
      }),
    );
  }
}

class MobileAppDeveloper extends StatefulWidget {
  const MobileAppDeveloper({Key? key}) : super(key: key);

  @override
  State<MobileAppDeveloper> createState() => MobileAppDeveloperState();
}

class MobileAppDeveloperState extends State<MobileAppDeveloper> {
  @override
  Widget build(BuildContext context) {
    return const CardWidget(
      profileImage:
          'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
      profileStrokeWidth: 2,
      Skils: 'Mobile App Developer - Frontend Developer - Graphic Designer',
      profileStrokeColor: Color.fromARGB(255, 255, 232, 232),
      leftElevateButtonText: 'Profile',
      rightElevateButtonText: 'Shortlist',
      backcroundColor: Color.fromARGB(255, 255, 232, 232),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget(
      {Key? key,
      required this.profileImage,
      required this.Skils,
      required this.leftElevateButtonText,
      required this.rightElevateButtonText,
      required this.backcroundColor,
      required this.profileStrokeColor,
      required this.profileStrokeWidth})
      : super(key: key);

  final String profileImage;
  final String Skils;
  final String leftElevateButtonText;
  final String rightElevateButtonText;
  final Color backcroundColor;
  final Color profileStrokeColor;
  final double profileStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 25),
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  color: backcroundColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            Positioned(
              top: -25,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                            blurRadius: 10,
                            color: Color.fromRGBO(128, 128, 128, 1),
                          )
                        ],
                        border: Border.all(
                            color: profileStrokeColor,
                            width: profileStrokeWidth),
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(profileImage))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    width: 150,
                    child: Text(
                      Skils,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 10, color: Colors.grey[600]),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(253, 151, 212, 223),
                              elevation: 0),
                          child: Text(
                            leftElevateButtonText,
                            style: GoogleFonts.poppins(
                                fontSize: 11, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        height: 25,
                        width: 76,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(253, 151, 212, 223),
                              elevation: 0),
                          child: Text(
                            rightElevateButtonText,
                            style: GoogleFonts.poppins(
                                fontSize: 11, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(width: 25),
      ],
    );
  }
}
