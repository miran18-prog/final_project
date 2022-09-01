import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class listButton extends StatelessWidget {
  listButton(
      {Key? key,
      required this.text,
      required this.icon,
      this.iconSize,
      this.backColor,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.hight,
      this.width,
      required this.socialUrl})
      : super(key: key);

  Color? backColor = Colors.white;
  final String text;
  Color? textColor = Colors.white;
  double? fontSize = 15;
  FontWeight? fontWeight = FontWeight.w400;
  double? iconSize = 15;
  double? hight = 40;
  double? width = 125;
  final IconData icon;
  final String socialUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('hi');

        Uri _url = Uri.parse(socialUrl);
        final response = await http.get(_url);

        if (response.statusCode == 200) {
          if (!await launchUrl(_url,
              mode: LaunchMode.externalNonBrowserApplication)) {
            throw 'Could not launch $_url';
          }
        }
      },
      child: Container(
        height: hight,
        width: width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.poppins(
                  fontWeight: fontWeight, color: textColor, fontSize: fontSize),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
