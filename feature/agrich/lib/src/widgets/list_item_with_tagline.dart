import 'package:agrich/src/cuisine_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class ListItemWithTagLine extends GetView<CuisineController> {
  final CuisineModel cuisineModel;
  final void Function(CuisineItem) onItemTap;
  const ListItemWithTagLine({
    super.key,
    required this.cuisineModel,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cuisineModel.header,
            style: Get.textTheme.labelSmall
                ?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              // shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: cuisineModel.cuisineItems.length,
              itemBuilder: (BuildContext context, int index) => _cardWithTag(
                cuisineModel.cuisineItems[index],
                onItemTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWithTag(CuisineItem item, void Function(CuisineItem) onTap) {
    return Container(
      alignment: AlignmentDirectional.centerStart,
      margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      width: 210,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          gradient: ThemeService(isDarkMode: Get.isDarkMode).stroke,
          boxShadow: !Get.isDarkMode
              ? []
              : [
                  BoxShadow(
                    color: Get.theme.primaryColorDark.withOpacity(0.30),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4), // changes position of shadow
                  ),
                ]),
      child: InkWell(
        onTap: () => onTap(item),
        borderRadius: const BorderRadius.all(
          Radius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                  item.photoUrl,
                ),
                backgroundColor: Get.theme.primaryColorDark.withOpacity(.12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 24.0),
              child: Text(
                item.name,
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Text(
                item.tag.name,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
