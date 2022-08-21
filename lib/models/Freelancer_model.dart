// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FreelancerModel {
  String username;
  String? phone_number;
  String? github;
  String? twitter;
  String? facebook;
  String? instagram;
  String? linkedIn;
  String description;
  DateTime? createdAt;
  bool? is_freelancer;
  FreelancerModel({
    required this.username,
    this.phone_number,
    this.github,
    this.twitter,
    this.facebook,
    this.instagram,
    this.linkedIn,
    required this.description,
    this.createdAt,
    this.is_freelancer,
  });

  FreelancerModel copyWith({
    String? username,
    String? phone_number,
    String? github,
    String? twitter,
    String? facebook,
    String? instagram,
    String? linkedIn,
    String? description,
    bool? is_freelancer,
  }) {
    return FreelancerModel(
      username: username ?? this.username,
      phone_number: phone_number ?? this.phone_number,
      github: github ?? this.github,
      twitter: twitter ?? this.twitter,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
      linkedIn: linkedIn ?? this.linkedIn,
      description: description ?? this.description,
      is_freelancer: is_freelancer ?? this.is_freelancer,
    );
  }

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
      'is_freelancer': is_freelancer,
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
      is_freelancer: map['is_freelancer'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory FreelancerModel.fromJson(String source) =>
      FreelancerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FreelancerModel(username: $username, phone_number: $phone_number, github: $github, twitter: $twitter, facebook: $facebook, instagram: $instagram, linkedIn: $linkedIn, description: $description, createdAt: $createdAt, is_freelancer: $is_freelancer)';
  }

  @override
  bool operator ==(covariant FreelancerModel other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.phone_number == phone_number &&
        other.github == github &&
        other.twitter == twitter &&
        other.facebook == facebook &&
        other.instagram == instagram &&
        other.linkedIn == linkedIn &&
        other.description == description &&
        other.is_freelancer == is_freelancer;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        phone_number.hashCode ^
        github.hashCode ^
        twitter.hashCode ^
        facebook.hashCode ^
        instagram.hashCode ^
        linkedIn.hashCode ^
        description.hashCode ^
        is_freelancer.hashCode;
  }
}
