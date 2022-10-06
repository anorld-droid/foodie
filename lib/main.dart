import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/sign_up.dart';
import 'package:trice/views/viewscreens/home_screen.dart';

void main() => runApp(GetMaterialApp(
      initialRoute: root,
      getPages: [
        GetPage(name: root, page: () => const Home()),
        GetPage(name: signup, page: () => const SignUp())
      ],
    ));
