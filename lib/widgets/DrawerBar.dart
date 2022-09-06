import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/authentication/auth.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/screens/Drawbar%20Screens/job_screen.dart';
import 'package:final_project/screens/SignIn_SignUp_Screen/SignIn.dart';
import 'package:final_project/screens/about_us_screen/about_us.dart';
import 'package:final_project/screens/user_Screen/user_operations/edit_profile_screen.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:final_project/widgets/test_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DrawerBar extends StatelessWidget {
  const DrawerBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return Drawer(
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
                    accountName: Text(freelancerModel.username),
                    accountEmail: Text(user.email!),
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
                            backgroundColor: Colors.grey,
                          ),
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://images.pexels.com/photos/4100130/pexels-photo-4100130.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'))),
                  );
                } else if (snapshot.hasError) {
                  return Text("oops something went wrong");
                } else {
                  return CustomLodingWidget();
                }
              }),
          ListTile(
            leading: const Icon(Icons.library_books),
            title: const Text('Jobs'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => JobsScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('testing'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => TestScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Edit account'),
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => EditAccountScreen())),
          ),
          ListTile(
            leading: const Icon(Icons.person_search),
            title: const Text('About us'),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AboutUsPage())),
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
