import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/routing/routes.dart';

class NewsRoomController extends GetxController {
  final controller = Get.find<BottomAppBarController>();

  navigateToNews(NewsPostModel newsPostModel) {
    Get.toNamed(newsDetailScreen, arguments: newsPostModel);
  }

  navigateToBriefs() async {
    controller.fabVisible.value = false;
    final result = await Get.toNamed(briefsScreen);
    if (result == true) {
      controller.fabVisible.value = true;
    } else {
      controller.fabVisible.value = true;
    }
  }
}
