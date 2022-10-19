import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:get/get.dart';
import 'package:trice/controller/news_details_controller.dart';
import 'package:trice/model/news/news_post.dart';

class CommentScreen extends GetView<NewsDetailController> {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NewsDetailController controller = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: controller.comments,
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            const CircleAvatar(
              //My username
              backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Zmx1dHRlciUyMGxvZ28lMjAlMjB0ZWNofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
              ),
              radius: 18,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 8.0),
              child: TextField(
                controller: controller.commentController,
                style: Get.textTheme.bodySmall,
                decoration: const InputDecoration(
                    hintText:
                        "Comment as myUsername", //TODO: change to username var
                    border: InputBorder.none),
              ),
            )),
            InkWell(
              onTap: () async {
                //Add to comments
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Get.theme.primaryColorDark),
                child: Text(
                  "Post",
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
                      color: color,
                      width: Get.width - 10,
                      child: RichText(
                        text: TextSpan(
                          text: comment.text,
                          style: Get.textTheme.bodySmall?.copyWith(
                              color: textColor, backgroundColor: color),
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
