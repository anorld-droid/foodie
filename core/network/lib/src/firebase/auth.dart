import 'package:firebase_auth/firebase_auth.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class UserAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> createAccount(
      {required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return 'Account created succesfully';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      } else {
        return e.message ?? 'Authentication error occurred.';
      }
    } catch (e) {
      return e.toString();
    }
  }

  Future<String> signInWithEmailPassword(
      {required String emailAddress, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      return 'Successful authentication.';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message ?? 'Authentication error';
    }
  }

  Future<void> signOut() async {
    return _auth.signOut();
  }

  bool isUserSignedIn() {
    return _auth.currentUser != null;
  }

  String? getUserId() {
    return _auth.currentUser?.uid;
  }

  String? getUserName() {
    return _auth.currentUser?.displayName ?? _auth.currentUser?.email;
  }

  String? getPhoneNumber() {
    return _auth.currentUser?.phoneNumber;
  }

  String? getUserPhotoUrl() {
    return _auth.currentUser?.photoURL;
  }

  bool? userExists(String phoneNumber) {
    return true;
  }
}
