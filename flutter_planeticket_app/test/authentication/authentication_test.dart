import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

import '../../lib/controllers/authentication/firebase_authentication.dart';
import '../../lib/controllers/ticket/ticket_controller.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuthentication{}
class MockTicketController extends Mock implements TicketController{}

void main() {

  late MockGoogleSignIn googleSignIn;
  setUp(() {
      googleSignIn = MockGoogleSignIn();
  });

  test('should return idToken and accessToken when authenticating', () async {
      final signInAccount = await googleSignIn.signIn();
      final signInAuthentication = await signInAccount!.authentication;
      expect(signInAuthentication, isNotNull);
      expect(googleSignIn.currentUser, isNotNull);
      expect(signInAuthentication.accessToken, isNotNull);
      expect(signInAuthentication.idToken, isNotNull);
  });

  test('should return null when google login is cancelled by the user', () async {
          googleSignIn.setIsCancelled(true);
          final signInAccount = await googleSignIn.signIn();
          expect(signInAccount, isNull);
  });

  test('testing google login twice, once cancelled, once not cancelled at the same test.', () async {
      googleSignIn.setIsCancelled(true);
      final signInAccount = await googleSignIn.signIn();
      expect(signInAccount, isNull);
      googleSignIn.setIsCancelled(false);
      final signInAccountSecondAttempt = await googleSignIn.signIn();
      expect(signInAccountSecondAttempt, isNotNull);
  });

}
