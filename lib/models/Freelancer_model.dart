// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:provider/provider.dart';

class FreelancerModel {
  String username;
  String? phone_number;
  String? github;
  String? twitter;
  String? facebook;
  String? instagram;
  String? linkedIn;
  String description;
  DateTime createdAt;

  FreelancerModel({
    required this.username,
    this.phone_number,
    this.github,
    this.twitter,
    this.facebook,
    this.instagram,
    this.linkedIn,
    required this.description,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'phone_number': phone_number,
      'github': github,
      'twitter': twitter,
      'facebook': facebook,
      'instagram': instagram,
      'linkedIn': linkedIn,
      'description': description,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory FreelancerModel.fromMap(Map<String, dynamic> map) {
    return FreelancerModel(
      username: map['username'] as String,
      phone_number:
          map['phone_number'] != null ? map['phone_number'] as String : null,
      github: map['github'] != null ? map['github'] as String : null,
      twitter: map['twitter'] != null ? map['twitter'] as String : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      instagram: map['instagram'] != null ? map['instagram'] as String : null,
      linkedIn: map['linkedIn'] != null ? map['linkedIn'] as String : null,
      description: map['description'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory FreelancerModel.fromJson(String source) =>
      FreelancerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
