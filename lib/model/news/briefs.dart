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

List<Brief> briefs() => [
      Brief(
          title:
              "This is because a floating app bar uses the scroll offset of its own Scrollable to dictate the floating action. Being two separate inner and outer Scrollables, a SliverAppBar in the outer header is not aware of changes in the scroll offset of the inner body.",
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
    ];
