import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<String?> createUser(String email, String password) async {   // đăng ký
    try {
      UserCredential credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      // return credential.user!.uid;
      return '${credential.user!}';
    } on FirebaseAuthException {
      return null;
    }
  }

  Future<String?> login(String email, String password) async {    // đăng nhập
    try {
      UserCredential credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      // return credential.user!.uid;
      return '${credential.user!}';
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

  Future<String?> loginWithGoogle() async {   // đăng nhập bằng account Google
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _firebaseAuth.signInWithCredential(authCredential);   // authResult = credential
    final User? user = authResult.user;
    if (user != null) {
      return '$user';
    }
    return null;
  }

}
