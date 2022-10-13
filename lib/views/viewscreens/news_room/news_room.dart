import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/news/briefs.dart';
import 'package:trice/model/news/main_news_layout.dart';
import 'package:trice/views/viewscreens/news_room/widgets.dart';

class NewsRoom extends StatelessWidget {
  const NewsRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            NewsPost(newsPostData: news()[0]),
            NewsPost(newsPostData: news()[2]),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                str.headline,
                style: Get.textTheme.labelSmall,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 172.0,
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: briefs().length,
                  itemBuilder: (BuildContext context, int index) =>
                      Briefs(brief: briefs()[index])),
            ),
            Divider(
              color:
                  Get.theme.primaryColorDark.withAlpha(50), //color of divider
              height: 32, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 2, //spacing at the start of divider
              endIndent: 2, //spacing at the end of divider
            ),
            ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: news().length,
                itemBuilder: (BuildContext context, int index) =>
                    NewsPost(newsPostData: news()[index])),
          ],
        ),
      ),
    );
  }
}
