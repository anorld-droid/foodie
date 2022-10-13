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
    return InkWell(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width - 104,
                  child: Text(
                    newsPostData.title,
                    style: Get.textTheme.bodyMedium,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    newsPostData.imageUrl,
                    height: 56.0,
                    width: 80.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2.0),
                      child: Image.network(
                        newsPostData.user.profilePhoto,
                        height: 20.0,
                        width: 24.0,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${newsPostData.user.name}·${newsPostData.datePublished}",
                      style: Get.textTheme.bodySmall!.copyWith(
                          color:
                              Get.textTheme.bodySmall!.color!.withAlpha(170)),
                    ),
                  ],
                ),
                Row(
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
                        gradient: ThemeService().newsPostIcons),
                    const SizedBox(
                      width: 8,
                    ),
                    GradientIcon(
                        onPressed: () {
                          //show bottom sheet with users name
                        },
                        icon: const Icon(
                          //TODO: Change icon to filled if the user has liked the post
                          Icons.alternate_email,
                          size: 16,
                        ),
                        size: 16,
                        gradient: ThemeService().newsPostIcons),
                    const SizedBox(
                      width: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Get.theme.primaryColorDark.withAlpha(50), //color of divider
            height: 16, //height spacing of divider
            thickness: 1, //thickness of divier line
            indent: 2, //spacing at the start of divider
            endIndent: 2, //spacing at the end of divider
          )
        ],
      ),
    );
  }
}

class Briefs extends StatelessWidget {
  final Brief brief;
  const Briefs({Key? key, required this.brief}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: 344,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Get.theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Get.theme.primaryColorDark.withOpacity(0.37),
              spreadRadius: 1,
              blurRadius: 12,
              blurStyle: BlurStyle.inner,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ]),
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Text(
                brief.title,
                style: Get.textTheme.bodyMedium,
                maxLines: 5,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        brief.user.profilePhoto,
                        height: 19.47,
                        width: 21.33,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${brief.user.name}·${brief.datePublished}",
                      style: Get.textTheme.bodySmall!.copyWith(
                          color:
                              Get.textTheme.bodySmall!.color!.withAlpha(170)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 24,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          //TODO: Change icon to filled if the user has liked the post
                          Icons.favorite_border_outlined,
                        ),
                        iconSize: 16,
                        color: Get.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    SizedBox(
                      width: 24,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          //TODO: Change icon to filled if the user has liked the post
                          Icons.alternate_email,
                        ),
                        iconSize: 16,
                        color: Get.theme.primaryColorDark,
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
