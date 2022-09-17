// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/about_us_screen/about_us.dart';
import 'package:final_project/screens/user_Screen/other_user/other_user_screen.dart';
import 'package:final_project/screens/user_Screen/user_account/user_account_screen.dart';
import 'package:final_project/widgets/test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class CardWidget extends StatelessWidget {
  CardWidget({
    Key? key,
    required this.freelancerModel,
  }) : super(key: key);
  final FreelancerModel freelancerModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.25),
                offset: Offset(0, 0),
                blurRadius: 7)
          ],
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: freelancerModel.imageUrl != null
                  ? Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              freelancerModel.imageUrl!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.only(left: 20),
                      height: 125,
                      width: 125,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        image: DecorationImage(
                          image: AssetImage('image/avatar.jpg'),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              width: 25,
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    freelancerModel.username,
                    presetFontSizes: [20, 19, 18, 17, 16, 15, 14],
                    style: GoogleFonts.poppins(
                        color: HexColor('#275EA3'),
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  AutoSizeText(
                    freelancerModel.skill,
                    minFontSize: 10,
                    maxFontSize: 20,
                    style: GoogleFonts.poppins(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 400),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        animation = CurvedAnimation(
                            parent: animation, curve: Curves.easeInOut);
                        return SlideTransition(
                          position: Tween<Offset>(
                                  begin: Offset(-1, 0), end: Offset.zero)
                              .animate(animation),
                          child: OtherUserScreen(
                            freelancerModel: freelancerModel,
                          ),
                        );
                      },
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return Container();
                      },
                    ),
                  );
                },
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



    // Container(
    //   height: 125,
    //   padding: EdgeInsets.symmetric(horizontal: 10),
    //   child: Card(
    //     child: ListTile(
    //       tileColor: Color(0Xf2D9CDB),
    //       title: Row(
    //         children: [
    //           SizedBox(height: 10),
    //           Container(
    //             height: 130,
    //             width: 100,
    //             margin: EdgeInsets.only(bottom: 8),
    //             decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image: NetworkImage(
    //                       'https://images.pexels.com/photos/4100130/pexels-photo-4100130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    //                   fit: BoxFit.fill),
    //               color: Colors.grey,
    //               borderRadius: BorderRadius.only(
    //                   topRight: Radius.circular(15),
    //                   bottomRight: Radius.circular(15)),
    //             ),
    //           ),
    //           SizedBox(width: 22),
    //           Column(
    //             children: [
    //               SizedBox(height: 20),
    //               Text(
    //                 usernName,
    //                 style: GoogleFonts.poppins(
    //                     fontSize: 20, fontWeight: FontWeight.w600),
    //               ),
    //               SizedBox(height: 5),
    //               Text(
    //                 Skils,
    //                 style: GoogleFonts.poppins(
    //                     fontSize: 15, fontWeight: FontWeight.w500),
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //       trailing: Padding(
    //         padding: const EdgeInsets.only(top: 25),
    //         child: IconButton(
    //           icon: Icon(Icons.arrow_forward_ios),
    //           onPressed: () {},
    //         ),
    //       ),
    //     ),
    //   ),
    // );