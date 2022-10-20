import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trice/model/data/briefs.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/routing/routes.dart';
import 'package:trice/views/viewscreens/news_room/widgets/news.dart';

class NewsRoomController extends GetxController {
  navigateToNews(NewsPostModel newsPostModel) {
    Get.toNamed(newsDetailScreen, arguments: newsPostModel);
  }

  navigateToBriefs() {
    Get.toNamed(briefsScreen);
  }
}
