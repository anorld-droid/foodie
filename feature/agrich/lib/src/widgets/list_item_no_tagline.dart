import 'package:agrich/src/cuisine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class ListItemNoTagLine extends GetView<CuisineController> {
  final CuisineModel cuisineModel;
  final void Function() onMoreClicked;
  final void Function() onItemTap;

  const ListItemNoTagLine({
    super.key,
    required this.cuisineModel,
    required this.onMoreClicked,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cuisineModel.header,
                style: Get.textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: IconButton(
                      padding: const EdgeInsets.only(right: 8),
                      onPressed: onMoreClicked,
                      icon: Icon(
                        Icons.arrow_forward,
                        color: Get.theme.primaryColorDark,
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
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

  Widget _cardWithTag(CuisineItem item, void Function() onTap) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                  item.photoUrl,
                )),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                item.name,
                style: Get.textTheme.labelSmall
                    ?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
