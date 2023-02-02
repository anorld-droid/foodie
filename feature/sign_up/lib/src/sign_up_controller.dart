import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class SignUpController extends GetxController with GetTickerProviderStateMixin {
  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late AnimationController animationController;
  Rx<Uint8List?>? image = Uint8List(1).obs;
  late final ImageUseCase _imageUseCase;
  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void onReady() {
    super.onReady();
    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();
    _imageUseCase = Get.find();
    image = null;
  }

  Rx<bool> inputValidated = false.obs;
  var searching = false.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void navigateToLogIn() {
    Get.offNamed<void>(Routes.root);
  }

  Future<void> createAccount() async {
    searching.value = true;
    animationController.repeat();
    var message = '';
    final authInputs = await validInputs();
    if (authInputs.isNotEmpty) {
      message = await _authenticateUser.createAccount(
          emailAddress: authInputs['email']!,
          password: authInputs['password']!);
      await _uploadUserInfo(_authenticateUser.getUserName() ?? 'Anonymous');
      Get.offNamed<void>(Routes.mainScreen);
    }
    if (message.isNotEmpty) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    searching.value = false;
    animationController.reset();
  }

  Future<Map<String, String>> validInputs() async {
    final emailAddress = emailController.text;
    final password = passwordController.text;
    var message = '';
    Map<String, String> authInputs = {};
    if (!(emailAddress.isEmail) && emailAddress.isEmpty) {
      message = 'Invalid email address';
    } else if (password.isEmpty) {
      message = 'Invalid password.';
    } else {
      authInputs = {'email': emailAddress, 'password': password};
    }
    if (message.isNotEmpty) {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    return authInputs;
  }

  Future<void> _uploadUserInfo(String username) async {
    var message = 'Sign up failed, please try again';
    String? uid = _authenticateUser.getUserId();
    final photoUrl = await saveProfilePicture(uid!);

    final User user = User(
        uid: uid, photoUrl: photoUrl, username: username, shippingInfo: null);
    _userModelUseCase.upload(uid, user);
    message = 'Account created successfully';

    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  Future<void> selectImage() async {
    image?.value = await pickImageFromGallery();
  }

  Future<String?> saveProfilePicture(String uid) async {
    return image != null
        ? await _imageUseCase.saveProfilePic(image!.value!, uid)
        : null;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
