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

List<NewsPostData> news() => [
      NewsPostData(
          imageUrl:
              "https://images.unsplash.com/file-1645031079751-256506f62da5image?dpr=2&auto=format&fit=crop&w=416&q=60",
          title:
              "Windows 11 it's a bunch of words that doesn't make sense, all it should do is span over 3 lines plus.",
          user: User(
            name: "Microsoft Inc.",
            profilePhoto:
                "https://images.unsplash.com/photo-1640763502425-7668dc1e4023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWljcm9zb2Z0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          ),
          datePublished: "3hrs ago",
          likes: [
            "Me",
            "and",
            "You",
          ],
          comments: {
            "You": "me",
            "I": "Comment",
          }),
      NewsPostData(
          imageUrl:
              "https://images.unsplash.com/file-1645031079751-256506f62da5image?dpr=2&auto=format&fit=crop&w=416&q=60",
          title:
              "Windows 11 it's a bunch of words that doesn't make sense, all it should do is span over 3 lines plus.",
          user: User(
            name: "Microsoft Inc.",
            profilePhoto:
                "https://images.unsplash.com/photo-1640763502425-7668dc1e4023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWljcm9zb2Z0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          ),
          datePublished: "3hrs ago",
          likes: [
            "Me",
            "and",
            "You",
          ],
          comments: {
            "You": "me",
            "I": "Comment",
          }),
      NewsPostData(
          imageUrl:
              "https://images.unsplash.com/file-1645031079751-256506f62da5image?dpr=2&auto=format&fit=crop&w=416&q=60",
          title:
              "Windows 11 it's a bunch of words that doesn't make sense, all it should do is span over 3 lines plus.",
          user: User(
            name: "Microsoft Inc.",
            profilePhoto:
                "https://images.unsplash.com/photo-1640763502425-7668dc1e4023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWljcm9zb2Z0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          ),
          datePublished: "3hrs ago",
          likes: [
            "Me",
            "and",
            "You",
          ],
          comments: {
            "You": "me",
            "I": "Comment",
          }),
      NewsPostData(
          imageUrl:
              "https://images.unsplash.com/file-1645031079751-256506f62da5image?dpr=2&auto=format&fit=crop&w=416&q=60",
          title:
              "Windows 11 it's a bunch of words that doesn't make sense, all it should do is span over 3 lines plus.",
          user: User(
            name: "Microsoft Inc.",
            profilePhoto:
                "https://images.unsplash.com/photo-1640763502425-7668dc1e4023?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bWljcm9zb2Z0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
          ),
          datePublished: "3hrs ago",
          likes: [
            "Me",
            "and",
            "You",
          ],
          comments: {
            "You": "me",
            "I": "Comment",
          })
    ];
