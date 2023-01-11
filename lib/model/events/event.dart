import 'package:trice/model/news/news_post.dart';

class EventModel {
  final Metadata metadata;
  final List<String> imageUrls;
  final String commentsLength;
  final String likesLength;
  final List<Comment> comments;
  final List<Metadata> likes;
  final String rating;
  final String attendees;
  final String description;
  EventModel(
      {required this.metadata,
      required this.imageUrls,
      required this.commentsLength,
      required this.likesLength,
      required this.likes,
      required this.comments,
      required this.rating,
      required this.attendees,
      required this.description});
}
