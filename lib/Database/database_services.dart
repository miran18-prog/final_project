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
    DateTime? createdAt,
  }) async {
    FreelancerModel freelancerModel = FreelancerModel(
        username: username,
        phone_number: phoneNumber,
        github: github,
        twitter: twitter,
        instagram: instagram,
        linkedIn: linkedIn,
        facebook: facebook,
        description: description,
        createdAt: createdAt!);
    await collectionReference.doc(uId).set(freelancerModel.toMap());
  }

  Stream<FreelancerModel> get freelancerData {
    return collectionReference.doc(uId).snapshots().map(_freelancerModel);
  }

  FreelancerModel _freelancerModel(DocumentSnapshot snapshot) {
    return FreelancerModel(
        username: snapshot['username'] ?? 'username',
        phone_number: snapshot['phone_number'] ?? 'phone_number',
        github: snapshot['github'] ?? 'github',
        twitter: snapshot['twitter'] ?? 'twitter',
        facebook: snapshot['facebook'] ?? 'facebook',
        instagram: snapshot["instagram"] ?? 'instagram',
        linkedIn: snapshot["linkedIn"] ?? 'linkedIn',
        description: snapshot["description"] ?? 'description',
        createdAt: snapshot["createdAt"] ?? 'createdAt');
  }
}
