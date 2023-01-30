import 'package:data_source/data_source.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 12.01.2023.

class AuthenticateUser {
  final AuthNetworkDataSource _authNetworkDataSource = Get.find();

  Future<void> withPhoneNUmber(String phoneNumber,
      {required Function verificationCompleted}) async {
    _authNetworkDataSource.signInWithPhoneNumber(phoneNumber,
        verificationCompleted: verificationCompleted);
  }

  String onCodeSent(String verificationId) =>
      _authNetworkDataSource.onCodeSent(verificationId);

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
