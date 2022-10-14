import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets.dart';

class NewsDetail extends StatelessWidget {
  final NewsPostModel newsPostModel;
  const NewsDetail({Key? key, required this.newsPostModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsTopBar(
          title: newsPostModel.title,
          profilePhoto: "newsPostModel.metadata.author.profilePhoto"),
      body: Center(
        child: Text(
          newsPostModel.title,
        ),
      ),
    );
  }
}
