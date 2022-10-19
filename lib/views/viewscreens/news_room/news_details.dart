import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/news_details_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/news_post_data.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/news_room/widgets/details.dart';
import 'package:trice/views/viewscreens/news_room/widgets/news.dart';

class NewsDetail extends GetView<NewsDetailController> {
  final NewsPostModel newsPostModel;
  const NewsDetail({Key? key, required this.newsPostModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      NewsDetailController(newsPostModel: newsPostModel),
    );
    Strings str = Strings();
    return Scaffold(
      appBar: DetailsTopBar(
          title: newsPostModel.publication?.name ?? "",
          profilePhoto: newsPostModel.publication?.logoUrl),
      body: SingleChildScrollView(
        controller: controller.scrollController.value,
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
            Column(
              children: controller.paragraphWidgets,
            ),
            const SizedBox(
              height: 56,
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        Widget returnWidget = const SizedBox();
        controller.extendFAB.value
            ? returnWidget = FloatingActionButton.extended(
                onPressed: () {},
                label: Text(
                  str.comments,
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: Get.theme.backgroundColor),
                ),
                icon: SvgPicture.asset(
                  str.commentSvg,
                  color: Get.theme.backgroundColor,
                ),
                backgroundColor: Get.theme.primaryColorDark,
              )
            : returnWidget = FittedBox(
                child: Stack(
                  alignment: const Alignment(1.4, -2.4),
                  children: [
                    FloatingActionButton(
                      enableFeedback: true,
                      tooltip: str.toolTip,
                      onPressed: () {},
                      backgroundColor: Get.theme.primaryColorDark,
                      child: SvgPicture.asset(
                        str.commentSvg,
                        color: Get.theme.backgroundColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      constraints:
                          const BoxConstraints(minHeight: 32, minWidth: 32),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 1,
                                blurRadius: 5,
                                color: Get.theme.primaryColorDark.withAlpha(50))
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: Get.theme.backgroundColor),
                      child: Center(
                        child: Text(
                          "${controller.commentLength}",
                          style: Get.textTheme.bodyMedium!
                              .copyWith(color: Get.theme.primaryColorDark),
                        ),
                      ),
                    )
                  ],
                ),
              );
        return returnWidget;
      }),
    );
  }
}
