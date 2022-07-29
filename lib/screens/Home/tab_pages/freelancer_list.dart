import 'dart:ffi';

import 'package:final_project/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class GraphicDesignerPage extends StatefulWidget {
  const GraphicDesignerPage({Key? key}) : super(key: key);

  @override
  State<GraphicDesignerPage> createState() => _GraphicDesignerPageState();
}

class _GraphicDesignerPageState extends State<GraphicDesignerPage> {
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: 33,
              ),
              Center(
                child: CardWidget(
                  profileImage:
                      'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
                  profileStrokeWidth: 1,
                  Skils: ' Graphic Designer',
                  profileStrokeColor: Colors.transparent,
                  leftElevateButtonText: 'Profile',
                  rightElevateButtonText: 'Shortlist',
                  backcroundColor: HexColor('#EFEFEF'),
                ),
              ),
              SizedBox(
                height: 13,
              ),
            ],
          );
        }),
      ),
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
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: 33,
              ),
              const Center(
                child: CardWidget(
                  profileImage:
                      'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
                  profileStrokeWidth: 1,
                  Skils: ' Graphic Designer',
                  profileStrokeColor: Colors.transparent,
                  leftElevateButtonText: 'Profile',
                  rightElevateButtonText: 'Shortlist',
                  backcroundColor: Color.fromARGB(255, 224, 242, 252),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class FrontEndDeveloper extends StatelessWidget {
  const FrontEndDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: 33,
              ),
              const Center(
                child: CardWidget(
                  profileImage:
                      'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
                  profileStrokeWidth: 1,
                  Skils: ' Graphic Designer',
                  profileStrokeColor: Colors.transparent,
                  leftElevateButtonText: 'Profile',
                  rightElevateButtonText: 'Shortlist',
                  backcroundColor: Color.fromARGB(255, 224, 242, 252),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class BackEndDeveloper extends StatelessWidget {
  const BackEndDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              SizedBox(
                height: 33,
              ),
              const Center(
                child: CardWidget(
                  profileImage:
                      'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
                  profileStrokeWidth: 1,
                  Skils: ' Graphic Designer',
                  profileStrokeColor: Colors.transparent,
                  leftElevateButtonText: 'Profile',
                  rightElevateButtonText: 'Shortlist',
                  backcroundColor: Color.fromARGB(255, 224, 242, 252),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class DesktopApplicationDeveloper extends StatelessWidget {
  const DesktopApplicationDeveloper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: ((context, index) {
          return Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(
                height: 33,
              ),
              const Center(
                child: CardWidget(
                  profileImage:
                      'https://scontent.febl5-1.fna.fbcdn.net/v/t39.30808-6/275845667_3888461888045740_5999289603495824659_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEryMNBsVZBDkY8lRuoVjShhIoHeLmdYtmEigd4uZ1i2RZ_19VytqiCvY-2TmH48qTB6Unpf8lwsfSqTfBcNkcU&_nc_ohc=qJE2DiBAW-kAX-M9XFq&tn=JAMVX_RKfDAVuOtR&_nc_ht=scontent.febl5-1.fna&oh=00_AT_WQL6QqnHFmfQzgq52CXjfEtn2rCB543R8aV_5fuxbew&oe=62D89F6C',
                  profileStrokeWidth: 1,
                  Skils: ' Graphic Designer',
                  profileStrokeColor: Colors.transparent,
                  leftElevateButtonText: 'Profile',
                  rightElevateButtonText: 'Shortlist',
                  backcroundColor: Color.fromARGB(255, 224, 242, 252),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
