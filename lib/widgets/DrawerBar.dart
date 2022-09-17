import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/notifications%20_screen/job_screen.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/about_us_screen/about_us.dart';
import 'package:final_project/job_screens/accepted_jobs.dart';
import 'package:final_project/screens/user_Screen/user_operations/edit_profile_screen.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:final_project/widgets/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerBar extends StatelessWidget {
  DrawerBar({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          StreamBuilder<DocumentSnapshot>(
              stream: DatabaseServices(uId: user.uid).getUser(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  FreelancerModel freelancerModel = FreelancerModel.fromMap(
                      snapshot.data.data() as Map<String, dynamic>);
                  return UserAccountsDrawerHeader(
                    accountName: Text(
                      freelancerModel.username,
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
                    accountEmail: Text(
                      user.email!,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    currentAccountPicture: freelancerModel.imageUrl != null
                        ? CircleAvatar(
                            child: ClipOval(
                              child: Image.network(
                                freelancerModel.imageUrl!,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : CircleAvatar(
                            backgroundImage: AssetImage('image/avatar.jpg'),
                            backgroundColor: Colors.grey,
                          ),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('image/background_drawer.png'))),
                  );
                } else if (snapshot.hasError) {
                  return Text("something went wrong");
                } else {
                  return CustomLodingWidget();
                }
              }),
          ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Accepted Jobs'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AcceptedJobs()));
              }),
          ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('testing'),
              onTap: () {
                Navigator.of(context).pop();
                ;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TestScreen()));
              }),
          ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Edit account'),
              onTap: () {
                Navigator.of(context).pop();

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditAccountScreen()));
              }),
          ListTile(
            leading: const Icon(Icons.person_search),
            title: const Text('About us'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => AboutUsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
