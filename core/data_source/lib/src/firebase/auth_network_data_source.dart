import 'package:network/network.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.
class AuthNetworkDataSource {
  final UserAuth _userAuth = UserAuth();

  Future<String> createAccount(
      {required String emailAddress, required String password}) async {
    return _userAuth.createAccount(
        emailAddress: emailAddress, password: password);
  }

  Future<String> signInWithEmailPassword(
      {required String emailAddress, required String password}) async {
    return _userAuth.signInWithEmailPassword(
        emailAddress: emailAddress, password: password);
  }

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

  String? getPhoneNumber() {
    return _userAuth.getPhoneNumber();
  }

  String? getUserPhotoUrl() {
    return _userAuth.getUserPhotoUrl();
  }
}
