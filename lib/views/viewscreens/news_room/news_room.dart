import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/model/news/briefs.dart';
import 'package:trice/model/news/main_news_layout.dart';
import 'package:trice/views/viewscreens/news_room/widgets.dart';

class NewsRoom extends StatelessWidget {
  const NewsRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, i) {
              return <Widget>[
                // ListView.builder(
                //   itemCount: news().length,
                //   prototypeItem: NewsPost(newsPostData: news().first),
                //   itemBuilder: (context, index) {
                //     return NewsPost(newsPostData: news()[index]);
                //   },
                // )
              ];
            },
            body: ListView.builder(
              itemCount: briefs().length,
              prototypeItem: Briefs(brief: briefs().first),
              itemBuilder: (context, index) {
                return Briefs(brief: briefs()[index]);
              },
            )));
  }
}
