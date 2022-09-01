import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FirstTabScreen extends StatelessWidget {
  const FirstTabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> projects = [
      'library System',
      'Simple Website',
      'Bdozawa Application'
    ];

    List<String> paths = [
      'image/undraw_Bibliophile_re_xarc.png', // libirary
      'image/undraw_Static_website_re_x70h.png', // webste7
      'image/undraw_Freelancer_re_irh4.png', //freelancer
    ];
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      physics: ScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 220, 239, 255),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 125,
                        width: 125,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                paths[index],
                              ),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          AutoSizeText(
                            projects[index],
                            presetFontSizes: [15, 14, 13],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}
