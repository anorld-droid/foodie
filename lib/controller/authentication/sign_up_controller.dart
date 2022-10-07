import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final String title = 'Sign up Screen';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  var count = 0.obs;
  increment() => count++;
  username() => Get.snackbar("Your username is", usernameController.text);
}
