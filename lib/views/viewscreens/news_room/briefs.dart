import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/newsRoomController.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/briefs.dart';
import 'package:trice/views/viewscreens/news_room/widgets/news.dart';

class BriefScreen extends GetView<NewsRoomController> {
  const BriefScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Scaffold(
      appBar: AppBar(
        title: Text(str.headline, style: Get.textTheme.displaySmall),
        centerTitle: true,
        backgroundColor: Get.theme.backgroundColor,
      ),
      body: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: briefs.length,
          itemBuilder: (BuildContext context, int index) => NewsBriefsCard(
                newsBriefModel: briefs[index],
                maxLines: 30,
              )),
    );
  }
}
