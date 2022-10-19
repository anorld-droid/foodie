import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:get/get.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/news_post_data.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets/comment.dart';
import 'package:trice/views/viewscreens/news_room/widgets/details.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailController extends GetxController {
  PostAuthor me = jose;
  NewsPostModel newsPostModel;
  NewsDetailController({required this.newsPostModel});

  late List<Widget> paragraphWidgets = List.empty(growable: true);

  int commentLength = 7;

  final scrollController = ScrollController().obs;
  final _maxScrollHeight = Get.height.obs;
  late var comments;
  Strings str = Strings();

  var extendFAB = false.obs;

  final TextEditingController commentController = TextEditingController();
  List<Widget> commentsWidgets = List.empty(growable: true);

  final now = DateTime.now();
  @override
  void onInit() {
    super.onInit();
    for (var paragraph in newsPostModel.paragraphs) {
      paragraphWidgets.add(ParagraphCard(paragraph: paragraph));
    }

    scrollController.value.addListener(() {
      _maxScrollHeight.value =
          scrollController.value.position.maxScrollExtent * 0.90;
      if (scrollController.value.offset >= _maxScrollHeight.value) {
        extendFAB.value = true;
      } else {
        extendFAB.value = false;
      }
    });

    for (var comment in comments) {
      commentsWidgets.add(
        CommentCard(
          comment: comment,
          color: comment.metadata.author == me
              ? Colors.black.withOpacity(.85)
              : Colors.white.withOpacity(.85),
          bubbleType: comment.metadata.author == me
              ? BubbleType.sendBubble
              : BubbleType.receiverBubble,
          textColor:
              comment.metadata.author == me ? Colors.white : Colors.black,
        ),
      );
    }
  }

  void launchURL(href) async {
    Uri url = Uri.parse(href);
    await canLaunchUrl(url)
        ? await launchUrl(url, mode: LaunchMode.inAppWebView)
        : throw 'Could not launch $url';
  }

  toolTip() {
    Get.snackbar(
      str.toolTipTitle,
      str.toolTip,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 5),
      isDismissible: true,
    );
  }

  commentBottomSheet() {
    Get.bottomSheet(const CommentScreen(),
        backgroundColor: Get.theme.backgroundColor,
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        isScrollControlled: true);
  }

  addComment(String text, NewsPostModel newsPostModel) {
    Comment comment = Comment(
      metadata: Metadata(me, "$now", 1),
      text: text,
    );

    newsPostModel.comments.add(
      comment,
    );
  }
}
