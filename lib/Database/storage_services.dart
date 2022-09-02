import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/models/post_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final user = FirebaseAuth.instance;
  Future<String> uploadeToFirebaseStorage({
    required String childName,
    required File file,
  }) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child(childName)
        .child(user.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUri = await snap.ref.getDownloadURL();
    return downloadUri;
  }

  Future<String> uploadePost(
      {required String title,
      required String description,
      required String uid,
      required File file}) async {
    String red = 'some error occured ';
    String uuid = Uuid().v1();

    try {
      String photoUrl = await StorageMethods()
          .uploadeToFirebaseStorage(childName: 'posts', file: file);
      PostModel postModel = PostModel(
        postDesctiption: description,
        uId: uid,
        imagePathId: uuid,
        imageUrl: photoUrl,
      );
      FirebaseFirestore.instance.doc(uuid).set(postModel.toMap());
    } catch (err) {
      red = err.toString();
    }
    return red;
  }
}
