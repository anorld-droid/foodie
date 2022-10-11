import 'package:trice/model/news/user.dart';

class Brief {
  final String title;
  final User user;
  final String datePublished;
  final List<String> likes; //Add the username of the person who has liked
  final Map<String, String> comments;
  Brief(
      {required this.title,
      required this.user,
      required this.datePublished,
      required this.likes,
      required this.comments});
}
