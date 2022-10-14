import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/sign_in.dart';
import 'package:trice/views/viewscreens/authentication/sign_up.dart';
import 'package:trice/views/viewscreens/events/events.dart';
import 'package:trice/views/viewscreens/main_screen.dart';
import 'package:trice/views/viewscreens/my_apartment/my_apartment.dart';
import 'package:trice/views/viewscreens/news_room/news_details.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';
import 'package:trice/views/viewscreens/tasks/tasks.dart';
import 'package:trice/views/viewscreens/trending/trending.dart';

void main() => runApp(GetMaterialApp(
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: root,
      getPages: [
        GetPage(name: root, page: () => const SignIn()),
        GetPage(name: signup, page: () => const SignUp()),
        GetPage(name: newsRoom, page: (() => const NewsRoom())),
        GetPage(name: mainScreen, page: () => const MainScreen()),
        GetPage(name: myApartment, page: () => const MyApartment()),
        GetPage(name: tasks, page: () => const Tasks()),
        GetPage(name: events, page: () => const Events()),
        GetPage(name: trending, page: () => const Trending()),
        GetPage(
            name: newsDetail,
            page: () => NewsDetail(newsPostModel: Get.arguments))
      ],
    ));
