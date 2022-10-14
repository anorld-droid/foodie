import 'package:get/get.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/routing/routes.dart';

class NewsRoomController extends GetxController {
  navigateToNews(NewsPostModel newsPostModel) {
    Get.toNamed(newsDetail, arguments: newsPostModel);
  }
}
