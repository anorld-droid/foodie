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
              Container(
                width: Get.width,
                height: 100,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                  Radius.circular(30),
                )),
                child: Image.network(newsPostModel.imageId),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                newsPostModel.title,
              ),
              const SizedBox(
                height: 8,
              ),
              newsPostModel.subtitle != null
                  ? SizedBox(
                      height: 16,
                      child: Text(
                        newsPostModel.subtitle ?? "",
                      ),
                    )
                  : const SizedBox(
                      height: 2,
                    ),
              Row(
                children: [
                  Container(
                    height: 19.47,
                    width: 21.33,
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColorDark.withOpacity(0.4),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(100))),
                    child: const Icon(Icons.account_circle),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 4,
                      ),
                      Text(newsPostModel.metadata.author.name),
                      Text(
                          "${newsPostModel.metadata.date} · ${newsPostModel.metadata.readTimeMinutes} mins")
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
