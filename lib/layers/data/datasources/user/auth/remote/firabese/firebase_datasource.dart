import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseDataSource {
  Stream<User?> getCurrentUser();
  Future<UserCredential?> signInWithGoogle();
  Future<void> signOut();
}
