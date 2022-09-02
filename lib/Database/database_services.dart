import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class DatabaseServices {
//* create a collection reference.

  final CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');

  final String? uId;
  final String? postImagePathId;
  DatabaseServices({this.uId, this.postImagePathId});

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
    String? coverImageUrl,
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
        'coverImageUrl': coverImageUrl,
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

  Stream<DocumentSnapshot> getUser() {
    return FirebaseFirestore.instance.collection('users').doc(uId).snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserPosts() {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('posts')
        .snapshots();
  }
}
