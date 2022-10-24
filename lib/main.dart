import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/authentication/sign_in.dart';
import 'package:trice/views/viewscreens/authentication/sign_up.dart';
import 'package:trice/views/viewscreens/events/events.dart';
import 'package:trice/views/viewscreens/main_screen.dart';
import 'package:trice/views/viewscreens/my_apartment/search_apartments.dart';
import 'package:trice/views/viewscreens/news_room/briefs.dart';
import 'package:trice/views/viewscreens/news_room/news_details.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';
import 'package:trice/views/viewscreens/trending/trending.dart';

void main() => runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: root,
      getPages: [
        GetPage(name: root, page: () => const SignIn()),
        GetPage(name: signupScreen, page: () => const SignUp()),
        GetPage(name: newsRoomScreen, page: (() => const NewsRoom())),
        GetPage(name: mainScreen, page: () => const MainScreen()),
        GetPage(name: eventsScreen, page: () => const Events()),
        GetPage(name: trendingScreen, page: () => const Trending()),
        GetPage(
            name: newsDetailScreen,
            page: () => NewsDetail(newsPostModel: Get.arguments)),
        GetPage(name: briefsScreen, page: () => const BriefScreen()),
        GetPage(name: searchApartment, page: (() => const SearchApartments())),
      ],
    ));
