import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseServices {
//* create a collection reference.

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  final String? uId;
  final String? uId2;
  final String? jobId;
  final String? postImagePathId;
  DatabaseServices({
    this.uId,
    this.postImagePathId,
    this.uId2,
    this.jobId,
  });

//? uId = Current user  _____    uId2 = ohterUser

  Future SetUser({
    required String username,
    required String skill,
    required String? phoneNumber,
    required String? github,
    required String? twitter,
    required String? facebook,
    required String? instagram,
    required String? linkedIn,
    String? userId,
    required String description,
    String? imageUrl,
    bool? is_freelancer,
  }) async {
    print("----------> ${uId}");

    return await collectionReference.doc(uId).set(
      {
        'username': username,
        'phone_number': phoneNumber,
        'github': github,
        'twitter': twitter,
        'facebook': facebook,
        'instagram': instagram,
        'linkedIn': linkedIn,
        'description': description,
        'is_freelancer': is_freelancer,
        'skill': skill,
        'imageUrl': imageUrl,
        'userId': userId,
      },
    );
  }

  Future editUser({
    String? username,
    String? skill,
    String? phoneNumber,
    String? github,
    String? twitter,
    String? facebook,
    String? instagram,
    String? linkedIn,
    String? userId,
    String? description,
    String? imageUrl,
    String? coverImageUrl,
    bool? is_freelancer,
  }) async {
    return await collectionReference.doc(uId).update(
      {
        'username': username,
        'phone_number': phoneNumber,
        'github': github,
        'twitter': twitter,
        'facebook': facebook,
        'instagram': instagram,
        'linkedIn': linkedIn,
        'description': description,
        'is_freelancer': is_freelancer,
        'skill': skill,
        'imageUrl': imageUrl,
        'coverImageUrl': coverImageUrl,
      },
    );
  }

  Stream<DocumentSnapshot> getUser() {
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

  Future addPost({
    required String uId,
    required String imagePath,
    required String imagePathId,
    required String postTitle,
    required String postDesctiption,
    String? imageUrl,
  }) async {
    return await collectionReference
        .doc(uId)
        .collection('posts')
        .doc(imagePathId)
        .set({
      "uId": uId,
      "imagePath": imagePath,
      "imagePathId": imagePathId,
      "postTitle": postTitle,
      "postDesctiption": postDesctiption,
      "imageUrl": imageUrl,
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserPosts() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('posts')
        .snapshots();
  }

  Future sendJob({
    required String jobId,
    required String clinetId,
    required String freelancerId,
    required String jobRequirment,
    required String jobDec,
    required String offer,
    required String username,
    required String is_finished,
    required String imageUrl,
  }) async {
    return await collectionReference
        .doc(uId2)
        .collection('jobs')
        .doc(jobId)
        .set({
      'clinetId': clinetId,
      'jobId': jobId,
      'freelancerId': freelancerId,
      'jobRequirment': jobRequirment,
      'jobDec': jobDec,
      'offer': offer,
      'username': username,
      'is_finished': is_finished,
      'imageUrl': imageUrl,
    });
  }
}
