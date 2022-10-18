import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets/details.dart';

class NewsDetailController extends GetxController {
  NewsPostModel newsPostModel;
  NewsDetailController({required this.newsPostModel});
  late List<Widget> paragraphWidgets = List.empty(growable: true);
  @override
  void onInit() {
    super.onInit();
    for (var paragraph in newsPostModel.paragraphs) {
      paragraphWidgets.add(ParagraphCard(paragraph: paragraph));
    }
  }
}
