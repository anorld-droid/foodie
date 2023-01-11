import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:get/get.dart';
import 'package:trice/controller/news/news_details_controller.dart';

import 'package:trice/domain/strings.dart';
import 'package:trice/model/news/news_post.dart';

class CommentScreen extends GetView<NewsDetailController> {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsDetailController controller = Get.find();
    Strings str = Strings();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        controller: controller.commentScrollController,
        child: Obx(
          () => Container(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: controller.commentsWidgets,
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              //My profile image username
              backgroundImage: NetworkImage(controller.me.profilePhoto!),
              radius: 18,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8.0),
              child: TextField(
                controller: controller.commentController,
                style: Get.textTheme.bodySmall,
                decoration: InputDecoration(
                    hintText: "${str.hintText} ${controller.me.name}",
                    border: InputBorder.none),
              ),
            )),
            InkWell(
              onTap: () async {
                controller.addComment();
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Get.theme.primaryColorDark),
                child: Text(
                  str.post,
                  style: TextStyle(color: Get.theme.backgroundColor),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

class CommentCard extends StatelessWidget {
  final Comment comment;
  final BubbleType bubbleType;
  final Color color;
  final Color textColor;

  const CommentCard({
    Key? key,
    required this.comment,
    required this.color,
    required this.bubbleType,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        bubbleType == BubbleType.sendBubble
            ? const SizedBox(
                width: 50,
              )
            : const SizedBox(),
        SizedBox(
          width: Get.width - 50,
          child: ChatBubble(
              clipper: ChatBubbleClipper2(type: bubbleType),
              backGroundColor: color,
              margin: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: const EdgeInsets.all(8.0),
                      width: Get.width - 10,
                      child: RichText(
                        text: TextSpan(
                          text: comment.text,
                          style: Get.textTheme.bodySmall
                              ?.copyWith(color: textColor),
                        ),
                      )),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 12,
                      ),
                      comment.metadata.author.profilePhoto == null
                          ? Icon(
                              Icons.account_circle,
                              color: Get.theme.primaryColorDark,
                              size: 32,
                            )
                          : CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                  comment.metadata.author.profilePhoto!),
                            ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        comment.metadata.author.name.trim(),
                        style:
                            Get.textTheme.bodySmall?.copyWith(color: textColor),
                      ),
                      Text(
                        " · ",
                        style: Get.textTheme.labelMedium
                            ?.copyWith(color: textColor),
                      ),
                      Text(
                        comment.metadata.date,
                        style: Get.textTheme.labelMedium
                            ?.copyWith(color: textColor),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              )),
        ),
      ],
    );
  }
}
