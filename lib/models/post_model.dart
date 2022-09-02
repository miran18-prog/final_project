// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostModel {
  String? uId;
  String? imagePath;
  String? imagePathId;
  String? postTitle;
  String? postDesctiption;
  String? imageUrl;
  PostModel({
    this.uId,
    this.imagePath,
    this.imagePathId,
    this.postTitle,
    this.postDesctiption,
    this.imageUrl,
  });

  PostModel copyWith({
    String? uId,
    String? imagePath,
    String? imagePathId,
    String? postTitle,
    String? postDesctiption,
    String? imageUrl,
  }) {
    return PostModel(
      uId: uId ?? this.uId,
      imagePath: imagePath ?? this.imagePath,
      imagePathId: imagePathId ?? this.imagePathId,
      postTitle: postTitle ?? this.postTitle,
      postDesctiption: postDesctiption ?? this.postDesctiption,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uId': uId,
      'imagePath': imagePath,
      'imagePathId': imagePathId,
      'postTitle': postTitle,
      'postDesctiption': postDesctiption,
      'imageUrl': imageUrl,
    };
  }

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      uId: map['uId'] != null ? map['uId'] as String : null,
      imagePath: map['imagePath'] != null ? map['imagePath'] as String : null,
      imagePathId:
          map['imagePathId'] != null ? map['imagePathId'] as String : null,
      postTitle: map['postTitle'] != null ? map['postTitle'] as String : null,
      postDesctiption: map['postDesctiption'] != null
          ? map['postDesctiption'] as String
          : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostModel.fromJson(String source) =>
      PostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostModel(uId: $uId, imagePath: $imagePath, imagePathId: $imagePathId, postTitle: $postTitle, postDesctiption: $postDesctiption, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant PostModel other) {
    if (identical(this, other)) return true;

    return other.uId == uId &&
        other.imagePath == imagePath &&
        other.imagePathId == imagePathId &&
        other.postTitle == postTitle &&
        other.postDesctiption == postDesctiption &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return uId.hashCode ^
        imagePath.hashCode ^
        imagePathId.hashCode ^
        postTitle.hashCode ^
        postDesctiption.hashCode ^
        imageUrl.hashCode;
  }
}
