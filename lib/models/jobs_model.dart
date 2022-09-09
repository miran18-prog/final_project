// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class JobModel {
  final String jobId;
  final String clinetId;
  final String freelancerId;
  final String jobRequirment;
  final String jobDec;
  final String offer;
  final String username;
  final String is_finished;
  final String imageUrl;
  JobModel({
    required this.jobId,
    required this.clinetId,
    required this.freelancerId,
    required this.jobRequirment,
    required this.jobDec,
    required this.offer,
    required this.username,
    required this.is_finished,
    required this.imageUrl,
  });

  JobModel copyWith({
    String? jobId,
    String? clinetId,
    String? freelancerId,
    String? jobRequirment,
    String? jobDec,
    String? offer,
    String? username,
    String? is_finished,
    String? imageUrl,
  }) {
    return JobModel(
      jobId: jobId ?? this.jobId,
      clinetId: clinetId ?? this.clinetId,
      freelancerId: freelancerId ?? this.freelancerId,
      jobRequirment: jobRequirment ?? this.jobRequirment,
      jobDec: jobDec ?? this.jobDec,
      offer: offer ?? this.offer,
      username: username ?? this.username,
      is_finished: is_finished ?? this.is_finished,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'jobId': jobId,
      'clinetId': clinetId,
      'freelancerId': freelancerId,
      'jobRequirment': jobRequirment,
      'jobDec': jobDec,
      'offer': offer,
      'username': username,
      'is_finished': is_finished,
      'imageUrl': imageUrl,
    };
  }

  factory JobModel.fromMap(Map<String, dynamic> map) {
    return JobModel(
      jobId: map['jobId'] as String,
      clinetId: map['clinetId'] as String,
      freelancerId: map['freelancerId'] as String,
      jobRequirment: map['jobRequirment'] as String,
      jobDec: map['jobDec'] as String,
      offer: map['offer'] as String,
      username: map['username'] as String,
      is_finished: map['is_finished'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobModel.fromJson(String source) =>
      JobModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'JobModel(jobId: $jobId, clinetId: $clinetId, freelancerId: $freelancerId, jobRequirment: $jobRequirment, jobDec: $jobDec, offer: $offer, username: $username, is_finished: $is_finished, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant JobModel other) {
    if (identical(this, other)) return true;

    return other.jobId == jobId &&
        other.clinetId == clinetId &&
        other.freelancerId == freelancerId &&
        other.jobRequirment == jobRequirment &&
        other.jobDec == jobDec &&
        other.offer == offer &&
        other.username == username &&
        other.is_finished == is_finished &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return jobId.hashCode ^
        clinetId.hashCode ^
        freelancerId.hashCode ^
        jobRequirment.hashCode ^
        jobDec.hashCode ^
        offer.hashCode ^
        username.hashCode ^
        is_finished.hashCode ^
        imageUrl.hashCode;
  }
}
