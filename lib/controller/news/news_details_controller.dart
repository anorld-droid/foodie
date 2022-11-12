import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
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

  ScrollController scrollController = ScrollController();
  ScrollController commentScrollController = ScrollController();
  final _maxScrollHeight = Get.height.obs;
  Strings str = Strings();

  var extendFAB = false.obs;

  final TextEditingController commentController = TextEditingController();
  RxList<Widget> commentsWidgets = <Widget>[].obs;

  final now = DateTime.now();

  final controller = Get.find<BottomAppBarController>();

  @override
  void onInit() {
    super.onInit();

    for (var paragraph in newsPostModel.paragraphs) {
      paragraphWidgets.add(ParagraphCard(paragraph: paragraph));
    }

    scrollController.addListener(() {
      _maxScrollHeight.value = scrollController.position.maxScrollExtent * 0.90;
      if (scrollController.offset >= _maxScrollHeight.value) {
        extendFAB.value = true;
      } else {
        extendFAB.value = false;
      }
    });

    for (var comment in newsPostModel.comments) {
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

  @override
  void onReady() {
    super.onReady();
    controller.fabVisible.value = false;
  }

  @override
  void onClose() {
    super.onClose();
    controller.fabVisible.value = true;
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

  addComment() {
    Comment comment = Comment(
      metadata: Metadata(me, now.format('M j, `y'), 1),
      text: commentController.text,
    );
    commentsWidgets.add(CommentCard(
      comment: comment,
      color: Colors.black.withOpacity(.85),
      bubbleType: BubbleType.sendBubble,
      textColor: Colors.white,
    ));
    newsPostModel.comments.add(
      comment,
    );
    commentController.clear();
    commentScrollController.animateTo(
        commentScrollController.position.maxScrollExtent + 100,
        duration: const Duration(microseconds: 100),
        curve: Curves.easeInBack);
  }
}
