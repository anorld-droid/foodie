import 'package:trice/model/news/user.dart';
import 'package:trice/views/viewscreens/news_room/widgets.dart';

class NewsPostData {
  final String imageUrl;
  final String title;
  final User user;
  final String datePublished;
  final List<String> likes; //Add the username of the person who has liked
  final Map<String, String> comments;
  NewsPostData(
      {required this.imageUrl,
      required this.title,
      required this.user,
      required this.datePublished,
      required this.likes,
      required this.comments});
}
