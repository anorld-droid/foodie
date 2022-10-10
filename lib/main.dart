import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/sign_in.dart';
import 'package:trice/views/viewscreens/authentication/sign_up.dart';
import 'package:trice/views/viewscreens/main_screen.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';

void main() => runApp(GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: mainScreen,
      getPages: [
        GetPage(name: root, page: () => const SignIn()),
        GetPage(name: signup, page: () => const SignUp()),
        GetPage(name: newsRoom, page: (() => const NewsRoom())),
        GetPage(name: mainScreen, page: () => const MainScreen())
      ],
    ));
