import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../lib/controllers/user_credentials/user_credentials.dart';

class MockUserCredentials extends Mock implements UserCredentials{}

void main() {

  const String name = 'Flutter Test';
  const String phoneNumber = '0123456789';
  const String gender = 'Male';
  const String birthdate = '01.01.2000';

  late MockFirebaseAuth auth;
  late MockUserCredentials userCredentials;
  late MockGoogleSignIn googleSignIn;

  setUp((){
    userCredentials = MockUserCredentials();
    googleSignIn = MockGoogleSignIn();
  });

  test('should return idToken and accessToken when authenticating', () async {

    final googleSignIn = MockGoogleSignIn();
    final signinAccount = await googleSignIn.signIn();
    final googleAuth = await signinAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in.
    final user = MockUser(
      isAnonymous: false,
      uid: 'test',
      email: 'test@gnail.com',
      displayName: name,
      phoneNumber: phoneNumber,
    );

    final authentication = MockFirebaseAuth(mockUser: user);
    final result = await authentication.signInWithCredential(credential);
    final userCredential = result.user;

    print(userCredential);

    expect(userCredential!.displayName, 'Flutter Test');

  });

}