import 'package:trice/model/news/news_post.dart';

class NewsBriefModel {
  final String title;
  final PostAuthor author;
  final Publication publication;
  final List<String> likes; //Add the username of the person who has liked
  final Map<String, String> comments;
  NewsBriefModel(
      {required this.title,
      required this.author,
      required this.publication,
      required this.likes,
      required this.comments});
}
