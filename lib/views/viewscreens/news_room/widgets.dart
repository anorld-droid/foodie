import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/model/news/briefs.dart';
import 'package:trice/model/news/main_news_layout.dart';
import 'package:trice/views/widgets/gradient_icon.dart';

class NewsPost extends StatelessWidget {
  final NewsPostData newsPostData;
  const NewsPost({required this.newsPostData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  newsPostData.title,
                  style: Get.textTheme.bodyMedium,
                  maxLines: 3,
                )
              ],
            ),
            Container(
              height: 40,
              width: 56,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Image.network(newsPostData.imageUrl),
            )
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Container(
              height: 16,
              width: 16,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              child: Image.network(newsPostData.user.profilePhoto),
            ),
            Text(
              "${newsPostData.user.name}·${newsPostData.datePublished}",
              style: Get.textTheme.bodySmall,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GradientIcon(
                    onPressed: () {
                      //Add user to likes list
                    },
                    icon: const Icon(
                      //TODO: Change icon to filled if the user has liked the post
                      Icons.favorite_border_outlined,
                    ),
                    size: 16,
                    gradient: ThemeService().stroke),
                GradientIcon(
                    onPressed: () {
                      //show bottom sheet with users name
                    },
                    icon: const Icon(
                      //TODO: Change icon to filled if the user has liked the post
                      Icons.alternate_email,
                    ),
                    size: 16,
                    gradient: ThemeService().stroke)
              ],
            )
          ],
        )
      ],
    );
  }
}

class Briefs extends StatelessWidget {
  final Brief brief;
  const Briefs({Key? key, required this.brief}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          brief.title,
          style: Get.textTheme.bodyMedium,
          maxLines: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GradientIcon(
                onPressed: () {
                  //Add user to likes list
                },
                icon: const Icon(
                  //TODO: Change icon to filled if the user has liked the post
                  Icons.favorite_border_outlined,
                ),
                size: 16,
                gradient: ThemeService().stroke),
            GradientIcon(
                onPressed: () {
                  //show bottom sheet with users name
                },
                icon: const Icon(
                  //TODO: Change icon to filled if the user has liked the post
                  Icons.alternate_email,
                ),
                size: 16,
                gradient: ThemeService().stroke)
          ],
        )
      ],
    );
  }
}
