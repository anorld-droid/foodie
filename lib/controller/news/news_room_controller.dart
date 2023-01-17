import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/model/news/news_post.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.

class NewsRoomController extends GetxController {
  final controller = Get.find<BottomAppBarController>();

  void navigateToNews(NewsPostModel newsPostModel) {
    Get.toNamed<void>(Routes.newsDetailScreen, arguments: newsPostModel);
  }

  void navigateToBriefs() async {
    controller.fabVisible.value = false;
    final result = await Get.toNamed<bool>(Routes.briefsScreen);
    if (result == true) {
      controller.fabVisible.value = true;
    } else {
      controller.fabVisible.value = true;
    }
  }
}
