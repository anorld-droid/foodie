import 'dart:typed_data';

import 'package:common/common.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class SignUpController extends GetxController with GetTickerProviderStateMixin {
  late final AuthenticateUser _authenticateUser;
  late final UserModelUseCase _userModelUseCase;
  late AnimationController animationController;
  Rx<Uint8List?> image = Uint8List(1).obs;
  late final ImageUseCase _imageUseCase;
  Rx<String> verificationCode = ''.obs;
  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animationController.repeat();
  }

  @override
  void onReady() {
    super.onReady();
    _authenticateUser = Get.find();
    _userModelUseCase = UserModelUseCase();

    _imageUseCase = Get.find();
    image.value = null;
  }

  Rx<bool> verificationHasPassed = false.obs;
  Rx<bool> inputValidated = false.obs;
  var searching = false.obs;

  PhoneNumber phoneNumber = PhoneNumber(isoCode: 'KE');
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController verificationController = TextEditingController();

  void navigateToLogIn() {
    Get.offNamed<void>(Routes.root);
  }

  Future<void> verifyNumber() async {
    if (inputValidated.value) {
      await _authenticateUser.withPhoneNUmber(phoneNumber.phoneNumber!,
          verificationCompleted: (bool value) {
        verificationHasPassed.value = value;
      });
    }
  }

  Future<void> signInWithGoogle() async {
    searching.value = true;
    var message = 'Sign up failed, please try again';
    if (verificationHasPassed.value) {
      String? uid = _authenticateUser.getUserId();
      final photoUrl = await saveProfilePicture(uid!);
      final username = usernameController.text;
      if (photoUrl != null && username.isNotEmpty) {
        final User user = User(
            uid: uid,
            photoUrl: photoUrl,
            username: username,
            shippingInfo: null);
        _userModelUseCase.upload(uid, user);
        message = 'Account created successfully';
        Get.offNamed<void>(Routes.mainScreen);
      }
    }
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
    searching.value = false;
  }

  void onCodeReceived() {
    _authenticateUser.onCodeSent(verificationCode.value);
  }

  Future<void> selectImage() async {
    image.value = await pickImageFromGallery();
  }

  Future<String?> saveProfilePicture(String uid) async {
    if (image.value != null) {
      return await _imageUseCase.saveProfilePic(image.value!, uid);
    } else {
      Fluttertoast.showToast(
          msg: 'Select an image to proceed',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
  }
}
