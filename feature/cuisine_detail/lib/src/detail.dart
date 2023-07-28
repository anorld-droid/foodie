import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/widgets/body.dart';
import 'package:cuisine_detail/src/widgets/bottom_nav.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineDetail extends GetView<Controller> {
  final CuisineItem cuisineItem;
  final String header;
  const CuisineDetail(
      {Key? key, required this.cuisineItem, required this.header})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(Controller(item: cuisineItem));
    controller.sellingPrice.value =
        cuisineItem.sellingPrice.value[controller.store.value]!;
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primaryContainer,
      body: DetailBody(cuisineItem: cuisineItem),
      bottomNavigationBar: BottomNav(
        cuisineItem: cuisineItem,
        header: header,
      ),
    );
  }
}
