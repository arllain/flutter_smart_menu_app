import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? uid;
  final bool? isVerified;
  final String? email;
  final String? photoURL;
  final String? displayName;

  const UserEntity(
      {required this.uid,
      required this.isVerified,
      required this.email,
      required this.photoURL,
      required this.displayName});

  @override
  List<Object?> get props => [
        uid,
        email,
        isVerified,
        photoURL,
        displayName,
      ];
}
