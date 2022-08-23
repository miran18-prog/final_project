import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/Database/database_services.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('users')
              .where('skill', isEqualTo: 'Graphic Designer')
              .snapshots(),
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.data == null) {
              return Text("no data");
            } else if (snapshot.hasData) {
              List<FreelancerModel> _freelancers = snapshot.data!.docs
                  .map(
                    (e) => FreelancerModel.fromMap(
                      e.data(),
                    ),
                  )
                  .toList();

              return ListView.builder(
                shrinkWrap: true,
                itemCount: _freelancers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_freelancers[index].username),
                  );
                },
              );
            } else if (snapshot.data == null) {
              return Text("no data");
            } else {
              return Center(child: CustomLodingWidget());
            }
          },
        ),
      ),
    );
  }
}
