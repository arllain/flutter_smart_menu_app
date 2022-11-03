import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smart_menu_app/layers/presentation/pages/login_register_page/login_register_page.dart';
import 'package:smart_menu_app/layers/presentation/pages/payment_page/payment_page.dart';
import 'package:smart_menu_app/layers/presentation/widgets/bottom_bar/bottom_bar.dart';

class AuthService {
  handleAuthStatePayment() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return const PaymentPage();
          } else {
            return const LoginRegisterPage();
          }
        });
  }

  handleAuthStateProfile() {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            return BottomBar(selectedIndex: 2);
          } else {
            return const LoginRegisterPage();
          }
        });
  }

  signInWithGoogle() async {
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

  signOut() {
    FirebaseAuth.instance.signOut();
    return BottomBar(selectedIndex: 0);
  }
}
