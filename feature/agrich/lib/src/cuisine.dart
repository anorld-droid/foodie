import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/list_item_no_tagline.dart';
import 'package:agrich/src/widgets/list_item_with_tagline.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Cuisine extends GetView<CuisineController> {
  const Cuisine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: controller.itemsLength,
              itemBuilder: (BuildContext context, int index) {
                CuisineModel cuisineModel = controller.items[index];
                if (index % 2 == 0) {
                  return ListItemWithTagLine(
                      cuisineModel: cuisineModel,
                      onMoreClicked: () {},
                      onItemTap: () {});
                } else {
                  return ListItemNoTagLine(
                      cuisineModel: cuisineModel,
                      onMoreClicked: () {},
                      onItemTap: () {});
                }
              }),
        ],
      ),
    );
  }
}
