import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_menu_app/layers/data/datasources/user/auth/remote/firabese/firebase_datasource.dart';

class FirebaseDataSourceImpl implements FirebaseDataSource {
  final FirebaseAuth firebaseAuth;

  FirebaseDataSourceImpl({
    required this.firebaseAuth,
  });

  @override
  Stream<User?> getCurrentUser() {
    return firebaseAuth.authStateChanges();
  }

  @override
  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: <String>['email']).signIn();

    // Obtain the auth detais from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new crendential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}
