import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithPhoneNumber(
      String phoneNumber, String verificationId, String smsCode) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );

      final UserCredential authResult =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (e) {
      print("Error signing in with phone number: $e");
      return null;
    }
  }
}
