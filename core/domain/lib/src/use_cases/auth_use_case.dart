import 'package:data_source/data_source.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.

class AuthenticateUser {
  final AuthNetworkDataSource _authNetworkDataSource = Get.find();

  Future<String> createAccount(
      {required String emailAddress, required String password}) async {
    return _authNetworkDataSource.createAccount(
        emailAddress: emailAddress, password: password);
  }

  Future<String> signInWithEmailPassword(
      {required String emailAddress, required String password}) async {
    return _authNetworkDataSource.signInWithEmailPassword(
        emailAddress: emailAddress, password: password);
  }

  String? getUserId() {
    return _authNetworkDataSource.getUserId();
  }

  Future<void> signOut() async {
    await _authNetworkDataSource.signOut();
  }

  bool isUserSignedIn() {
    return _authNetworkDataSource.isUserSignedIn();
  }

  String? getUserName() {
    return _authNetworkDataSource.getUserName();
  }

  String? getPhoneNumber() {
    return _authNetworkDataSource.getPhoneNumber();
  }

  String? getUserProfilePic() {
    return _authNetworkDataSource.getUserPhotoUrl();
  }
}
