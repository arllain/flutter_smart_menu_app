import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_menu_app/layers/domain/entities/user/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.photoURL,
    required super.isVerified,
    required super.displayName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      photoURL: json['photoURL'],
      isVerified: json['isVerified'] ?? '',
      displayName: json['displayName'] ?? '',
    );
  }

  factory UserModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    return UserModel(
      uid: doc.get('id'),
      email: doc.get('email'),
      isVerified: doc.get('isVerified'),
      photoURL: doc.get('photoURL'),
      displayName: doc.get('displayName'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'isVerified': isVerified,
      'photoURL': photoURL,
      'displayName': displayName
    };
  }
}
