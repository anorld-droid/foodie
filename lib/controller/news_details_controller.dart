import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets/details.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailController extends GetxController {
  NewsPostModel newsPostModel;
  NewsDetailController({required this.newsPostModel});
  late List<Widget> paragraphWidgets = List.empty(growable: true);
  int commentLength = 7;
  final double _maxScrollHeight = Get.height * 0.90;
  final scrollController = ScrollController().obs;
  var extendFAB = false.obs;

  @override
  void onInit() {
    super.onInit();
    for (var paragraph in newsPostModel.paragraphs) {
      paragraphWidgets.add(ParagraphCard(paragraph: paragraph));
    }
    scrollController.value.addListener(() {
      if (scrollController.value.offset >= _maxScrollHeight) {
        extendFAB.value = true;
      } else {
        extendFAB.value = false;
      }
    });
  }

  void launchURL(href) async {
    Uri url = Uri.parse(href);
    await canLaunchUrl(url)
        ? await launchUrl(url, mode: LaunchMode.inAppWebView)
        : throw 'Could not launch $url';
  }
}
