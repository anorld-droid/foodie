import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class AuthNetworkDataSource {
  final UserAuth _userAuth = UserAuth();

  Future<void> signInWithPhoneNumber(String phoneNumber,
      {required Function verificationCompleted}) async {
    _userAuth.signInWithPhoneNumber(phoneNumber,
        verificationCompleted: verificationCompleted);
  }

  String onCodeSent(String verificationId) =>
      _userAuth.onCodeSent(verificationId: verificationId);

  String? getUserId() {
    return _userAuth.getUserId();
  }

  Future<void> signOut() async {
    return _userAuth.signOut();
  }

  bool isUserSignedIn() {
    return _userAuth.isUserSignedIn();
  }

  String? getUserName() {
    return _userAuth.getUserName();
  }

  String? getUserPhotoUrl() {
    return _userAuth.getUserPhotoUrl();
  }
}
