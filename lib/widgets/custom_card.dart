// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auto_size_text/auto_size_text.dart';
import 'package:banner_listtile/banner_listtile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/Home/home_page.dart';
import 'package:final_project/screens/about_us_screen/about_us.dart';
import 'package:final_project/screens/user_Screen/other_user_screen.dart';
import 'package:final_project/screens/user_Screen/user_account/user_account_screen.dart';
import 'package:final_project/widgets/test_screen.dart';
import 'package:flutter/material.dart';
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
    return Container(
      height: 100,
      width: 375,
      color: Color(0Xf2D9CDB),
      child: Row(
        children: [
          freelancerModel.imageUrl != null
              ? Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            freelancerModel.imageUrl!),
                        fit: BoxFit.cover),
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                )
              : Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
          SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AutoSizeText(
                      freelancerModel.username,
                      style: GoogleFonts.poppins(
                          fontSize: 19, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      minFontSize: 15,
                      maxFontSize: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: AutoSizeText(
                      freelancerModel.skill,
                      style: GoogleFonts.poppins(
                          fontSize: 11, fontWeight: FontWeight.w400),
                      maxLines: 1,
                      minFontSize: 5,
                      maxFontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      animation = CurvedAnimation(
                          parent: animation, curve: Curves.easeInOut);
                      return FadeTransition(
                        opacity: animation,
                        child: OthersScreen(
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