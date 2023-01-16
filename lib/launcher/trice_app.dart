import 'package:common/common.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sign_up/sign_up.dart';
import 'package:trice/launcher/trice_app_controller.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/authentication/sign_in.dart';
import 'package:trice/views/viewscreens/events/events.dart';
import 'package:trice/views/viewscreens/main_screen.dart';
import 'package:trice/views/viewscreens/my_apartment/search_apartments.dart';
import 'package:trice/views/viewscreens/news_room/briefs.dart';
import 'package:trice/views/viewscreens/news_room/news_details.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';
import 'package:trice/views/viewscreens/trending/trending.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class TriceApp extends GetView<TriceAppController> {
  const TriceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<TriceAppController>(() => TriceAppController(), fenix: true);
    return Obx(() =>  GetMaterialApp(
      initialBinding: TriceBinding(),
      debugShowCheckedModeBanner: false,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode:controller.themeMode.value,
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
            page: () {
              NewsPostModel model = Get.arguments as NewsPostModel;
              return NewsDetail(newsPostModel: model);
            }),
        GetPage(name: briefsScreen, page: () => const BriefScreen()),
        GetPage(name: searchApartment, page: (() => const SearchApartments())),
      ],
    ));
  }
}
