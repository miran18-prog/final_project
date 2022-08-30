// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:url_launcher/url_launcher_string.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class AboutUsPage extends StatelessWidget {
//   final String logoPath = 'assets/images/slider/logo.png';
//   const AboutUsPage({Key? key}) : super(key: key);

// //* About us screen for now is completed
// //* this screen is for information about developer of the application and his social media
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('About Us'),
//         centerTitle: true,
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               //* circle image
//               OwnerAvatar(),
//               const SizedBox(height: 35),
//               //* name
//               //* description
//               const SizedBox(height: 35),

//               //* messege
//               const SizedBox(height: 40),

//               const SizedBox(height: 70),
//               //* text contact

//               //* contact icon
//               //* goback button
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   launchUrl(String url) async {
//     if (await canLaunchUrlString(url)) {
//       await launchUrlString(url, mode: LaunchMode.platformDefault);
//     } else {
//       throw 'Could not launch the $url';
//     }
//   }

//   Widget OwnerAvatar() {
//     return Container(
//       height: 105,
//       margin: EdgeInsets.only(top: 10),
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         image: DecorationImage(
//           image: AssetImage('images/my.jpg'),
//         ),
//       ),
//     );
//   }

//   Widget SocialContactDeveloper({required String instagramIconPath}) {
//     return Row(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 65,
//             right: 10,
//             top: 20,
//           ),
//           child: IconButton(
//             onPressed: () {
//               final url = 'https://www.facebook.com/aree.ahmed.311';
//               launchUrl(url);
//             },
//             icon: Icon(
//               Icons.facebook,
//               color: Colors.blue,
//             ),
//             iconSize: 40,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(
//             left: 10,
//             right: 10,
//             top: 20,
//           ),
//           child: IconButton(
//             onPressed: () {
//               final url = 'https://github.com/areeahmed';
//               launchUrl(url);
//             },
//             icon: FaIcon(
//               FontAwesomeIcons.github,
//               color: Colors.blue,
//             ),
//             iconSize: 35,
//           ),
//         )
//       ],
//     );
//   }
// }
