import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/user.dart';

class FirebaseAuthentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  late UserCredentialData? userCredentialData;

  Future<UserCredentialData?> createUser(String email, String password) async {   // đăng ký
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      // return credential.user!.uid;
      // return '${credential.user!}';

      userCredentialData = UserCredentialData(
        uid: credential.user!.uid,
        email: credential.user!.email,
        displayName: credential.user!.displayName,
        photoURL: credential.user!.photoURL,
      );
      return userCredentialData;

    } on FirebaseAuthException {
      return null;
    }
  }

  Future<UserCredentialData?> login(String email, String password) async {    // đăng nhập
    try {
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      // return credential.user!.uid;
      // return '${credential.user!}';

      userCredentialData = UserCredentialData(
        uid: credential.user!.uid,
        email: credential.user!.email,
        displayName: credential.user!.displayName,
        photoURL: credential.user!.photoURL,
      );
      return userCredentialData;

    } on FirebaseAuthException {
      return null;
    }
  }

  Future<bool> logout() async {   // đăng xuất
    try {
      _firebaseAuth.signOut();
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  Future<UserCredentialData?> loginWithGoogle() async {   // đăng nhập bằng account Google
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _firebaseAuth.signInWithCredential(authCredential);   // authResult = credential
    final User? user = authResult.user;
    if (user != null) {
      // return '$user';
      userCredentialData = UserCredentialData(
        uid: user.uid,
        email: user.email,
        displayName: user.displayName,
        photoURL: user.photoURL,
      );
      return userCredentialData;
    }
    return null;
  }

}
