import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trice/controller/newsRoomController.dart';
import 'package:trice/model/news/news_brief.dart';
import 'package:trice/model/news/news_post.dart';

class NewsPostCard extends GetView<NewsRoomController> {
  final NewsPostModel newsPostModel;
  const NewsPostCard({required this.newsPostModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      NewsRoomController(),
    );
    return InkWell(
      onTap: () => controller.navigateToNews(newsPostModel),
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
                    newsPostModel.title,
                    style: Get.textTheme.bodyMedium,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    softWrap: true,
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    newsPostModel.imageId,
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
                    newsPostModel.metadata.author.profilePhoto == null
                        ? Container(
                            height: 20.0,
                            width: 24.0,
                            decoration: BoxDecoration(
                                color:
                                    Get.theme.primaryColorDark.withOpacity(0.4),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100))),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.network(
                              newsPostModel.metadata.author.profilePhoto ?? "",
                              height: 20.0,
                              width: 24.0,
                              fit: BoxFit.fill,
                            ),
                          ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      newsPostModel.publication?.name == null
                          ? newsPostModel.metadata.author.name
                          : "${newsPostModel.metadata.author.name} · ${newsPostModel.publication?.name}",
                      style: Get.textTheme.bodySmall!.copyWith(
                          color:
                              Get.textTheme.bodySmall!.color!.withAlpha(170)),
                    ),
                  ],
                ),
                Row(
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

class NewsBriefsCard extends StatelessWidget {
  final NewsBriefModel newsBriefModel;
  const NewsBriefsCard({Key? key, required this.newsBriefModel})
      : super(key: key);

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
                newsBriefModel.title,
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
                    newsBriefModel.author.profilePhoto == null
                        ? Container(
                            height: 19.47,
                            width: 21.33,
                            decoration: BoxDecoration(
                                color:
                                    Get.theme.primaryColorDark.withOpacity(0.4),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100))),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(2.0),
                            child: Image.network(
                              newsBriefModel.author.profilePhoto ?? "",
                              height: 19.47,
                              width: 21.33,
                              fit: BoxFit.fill,
                            ),
                          ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${newsBriefModel.author.name}·${newsBriefModel.publication.name}",
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

class DetailsTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String profilePhoto;
  const DetailsTopBar(
      {Key? key, required this.title, required this.profilePhoto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Row(
        children: [
          SizedBox(
            height: 32,
            width: 32,
            child: IconButton(
              onPressed: () => Get.back(),
              padding: const EdgeInsets.only(left: 8),
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Get.theme.primaryColorDark,
                size: 24,
              ),
              iconSize: 24,
            ),
          ),
          Container(
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.only(left: 8),
            child: CircleAvatar(
              backgroundColor: Colors.white38,
              radius: 24,
              backgroundImage: NetworkImage(profilePhoto),
            ),
          ),
        ],
      ),
      leadingWidth: 88,
      title: Text(title, style: Get.textTheme.displaySmall),
      backgroundColor: Get.theme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
