import 'dart:async';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';    // use to saving username when register new account

class FirebaseAuthentication {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? errorMessage;

  Future<String?> createUser(String email, String username, String password) async {   // đăng ký

    try {

      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'username': username,
        'email': email,
      });

      print('Signed up Successfully');
      return null;

    } on FirebaseAuthException catch (err) {

      print('FirebaseAuthException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } on PlatformException catch (err) {

      print('PlatformException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } catch (err) {

      print('error: $err');

      errorMessage = err.toString();

      return errorMessage;

    }

  }

  Future<String?> login(String email, String password) async {    // đăng nhập

    try {

      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).whenComplete(() {
        print('Signed in Successfully');
        return null;    // Signed in Successfully
      });

    } on FirebaseAuthException catch (err) {

      print('FirebaseAuthException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } on PlatformException catch (err) {

      print('PlatformException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } catch (err) {

      print('error: $err');

      errorMessage = err.toString();

      return errorMessage;

    }

  }

  Future<bool> logout() async {   // đăng xuất

    try {
      _firebaseAuth.signOut().whenComplete(() => true);
      return false;
    } on FirebaseAuthException {
      return false;
    }

  }

  Future<String?> loginWithGoogle() async {   // đăng nhập bằng account Google

    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
    final AuthCredential googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {

      await _firebaseAuth.signInWithCredential(googleAuthCredential).whenComplete(() {
        print('Signed in with Google Successfully');
        return null;    // Signed in with Google Successfully
      });

    } on FirebaseAuthException catch (err) {

      print('FirebaseAuthException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } on PlatformException catch (err) {

      print('PlatformException error: $err');

      errorMessage = 'Sign in Failed! An error occurred, please check your credentials again';

      if (err.message != null) {
        errorMessage = err.message!;
      }

      return errorMessage;

    } catch (err) {

      print('error: $err');

      errorMessage = err.toString();

      return errorMessage;

    }

  }

}