import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> signInWithGoogleNative() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: [
        'email',
        'profile',
      ],
    ).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    UserCredential? userCredential =  await FirebaseAuth.instance.currentUser?.linkWithCredential(credential);
    return userCredential?.user?.uid;
  }

  Future<void> signInWithPhoneNumber(String phoneNumber,
      {required Function verificationCompleted}) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
        verificationCompleted(true);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          // ignore: todo
          //TODO: Log to crashlytics
        }
        verificationCompleted(false);
      },
      codeSent: (String verificationId, int? resendToken) async {
        // Update the UI - wait for the user to enter the SMS code
        String smsCode = onCodeSent();
        if (smsCode.isNotEmpty) {
          // Create a PhoneAuthCredential with the code
          PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: smsCode);
          // Sign the user in (or link) with the credential
          await _auth.signInWithCredential(credential);
        }
      },
      timeout: const Duration(seconds: 60),
      codeAutoRetrievalTimeout: (String verificationId) {
        // ignore: todo
        ///TODO('In the next phase add the counter time feature')
      },
    );
  }

  String onCodeSent({String verificationId = ''}) => verificationId;

  Future<void> signOut() async {
    return _auth.signOut();
  }

  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }

  String? getUserId() {
    return _auth.currentUser?.uid;
  }

  String? getUserName( ){
    return _auth.currentUser?.displayName;

  }
  String? getUserPhotoUrl() {
    return _auth.currentUser?.photoURL;
  }
}
