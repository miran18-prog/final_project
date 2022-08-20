import 'dart:async';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Freelancer_model.dart';

class DatabaseServices {
//* create a collection reference.

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  final String? uId;
  DatabaseServices({this.uId});

  Future updateUser({
    required String username,
    required String? phoneNumber,
    required String? github,
    required String? twitter,
    required String? facebook,
    required String? instagram,
    required String? linkedIn,
    required String description,
    bool? is_freelancer,
    DateTime? createdAt,
  }) async {
    print("----------> ${uId}");

    return await collectionReference.doc(uId).set({
      'username': username,
      'phone_number': phoneNumber,
      'github': github,
      'twitter': twitter,
      'facebook': facebook,
      'instagram': instagram,
      'linkedIn': linkedIn,
      'description': description,
      'createdAt': createdAt,
      'is_freelancer': is_freelancer,
    });
  }

  Stream<FreelancerModel> get freelancerData {
    return collectionReference.doc(uId).snapshots().map(freelancerModel);
  }

  Stream<DocumentSnapshot> getUser() {
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

  FreelancerModel freelancerModel(DocumentSnapshot snapshot) {
    return FreelancerModel(
        username: snapshot['username'],
        phone_number: snapshot['phone_number'],
        github: snapshot['github'],
        twitter: snapshot['twitter'],
        facebook: snapshot['facebook'],
        instagram: snapshot["instagram"],
        linkedIn: snapshot["linkedIn"],
        description: snapshot["description"],
        createdAt: snapshot["createdAt"],
        is_freelancer: snapshot["is_freelancer"]);
  }
}
