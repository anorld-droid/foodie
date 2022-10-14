import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/newsRoomController.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/briefs.dart';
import 'package:trice/model/data/news_post_data.dart';
import 'package:trice/views/viewscreens/news_room/widgets.dart';

class NewsRoom extends GetView<NewsRoomController> {
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
            NewsPostCard(newsPostModel: posts[0]),
            NewsPostCard(newsPostModel: posts[1]),
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
                  itemCount: briefs.length,
                  itemBuilder: (BuildContext context, int index) =>
                      NewsBriefsCard(newsBriefModel: briefs[index])),
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
                itemCount: posts.length - 2,
                itemBuilder: (BuildContext context, int index) {
                  var newList = posts.skip(2);
                  return NewsPostCard(newsPostModel: newList.elementAt(index));
                }),
          ],
        ),
      ),
    );
  }
}
