import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets/news.dart';

class NewsDetail extends StatelessWidget {
  final NewsPostModel newsPostModel;
  const NewsDetail({Key? key, required this.newsPostModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DetailsTopBar(
            title: newsPostModel.publication?.name ?? "",
            profilePhoto: "newsPostModel.metadata.author.profilePhoto"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  newsPostModel.imageId,
                  width: Get.width - 40,
                  height: 200,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  newsPostModel.title,
                  style: Get.textTheme.headlineMedium,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              newsPostModel.subtitle != null
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      child: Text(
                        newsPostModel.subtitle ?? "",
                        softWrap: true,
                        style: Get.textTheme.headlineSmall,
                      ),
                    )
                  : const SizedBox(
                      height: 2,
                    ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Icon(
                    Icons.account_circle,
                    color: Get.theme.primaryColorDark,
                    size: 32,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        newsPostModel.metadata.author.name.trim(),
                        style: Get.textTheme.bodyMedium,
                      ),
                      Text(
                        "${newsPostModel.metadata.date} · ${newsPostModel.metadata.readTimeMinutes} mins",
                        style: Get.textTheme.bodySmall,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ));
  }
}
