import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/sign_in.dart';
import 'package:trice/views/viewscreens/authentication/sign_up.dart';

void main() => runApp(GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: root,
      getPages: [
        GetPage(name: root, page: () => const SignIn()),
        GetPage(name: signup, page: () => const SignUp())
      ],
    ));
