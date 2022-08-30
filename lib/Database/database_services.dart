import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/Freelancer_model.dart';
import 'package:final_project/models/post_model.dart';

class DatabaseServices {
//* create a collection reference.

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  final String? uId;
  DatabaseServices({this.uId});

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
    bool? is_freelancer,
  }) async {
    print("----------> ${uId}");

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
      },
    );
  }

  Future addPost({
    required String uId,
    required String imagePath,
    required String imagePathId,
    required String postTitle,
    required String postDesctiption,
    String? imageUrl,
  }) async {
    return await collectionReference.doc(uId).collection('posts').doc(uId).set({
      "uId": uId,
      "imagePath": imagePath,
      "imagePathId": imagePathId,
      "postTitle": postTitle,
      "postDesctiption": postDesctiption,
      "imageUrl": imageUrl,
    });
  }

  Stream<DocumentSnapshot> getUser() {
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

  Stream<DocumentSnapshot> getUserPosts() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('posts')
        .doc(uId)
        .snapshots();
  }
}
