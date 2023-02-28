import 'package:agrich/src/cuisine_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class ListItemNoTagLine extends GetView<CuisineController> {
  final CuisineModel cuisineModel;
  final void Function(CuisineItem) onItemTap;

  const ListItemNoTagLine({
    super.key,
    required this.cuisineModel,
    required this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            cuisineModel.header,
            style:
                Get.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 315,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: cuisineModel.cuisineItems.length,
              itemBuilder: (BuildContext context, int index) => _cardWithoutTag(
                cuisineModel.cuisineItems[index],
                onItemTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardWithoutTag(CuisineItem item, void Function(CuisineItem) onTap) {
    return Container(
      margin: const EdgeInsets.only(left: 12, top: 8),
      width: Get.width * 0.85,
      child: Column(
        children: [
          InkWell(
            onTap: () => onTap(item),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              elevation: !Get.isDarkMode ? 0 : 0,
              child: Container(
                width: Get.width * 0.85,
                height: 200,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColorDark.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                      image: NetworkImage(
                        item.photoUrl,
                      ),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Get.textTheme.bodyLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                          softWrap: true,
                          maxLines: 4,
                          overflow: TextOverflow.visible,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          item.stockTag,
                          style: Get.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w100,
                            color: Get.theme.primaryColorDark.withOpacity(.8),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Obx(
                          () => Text(
                            '${CommonStrings.currency} ${item.sellingPrice.value.toStringAsFixed(2)}',
                            style: Get.textTheme.bodySmall
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4.0, vertical: 1),
                          child: Text(
                            'Qty',
                            style: Get.textTheme.bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.decrementQty(item),
                          child: Icon(
                            Icons.do_not_disturb_on_outlined,
                            color: Get.theme.primaryColorDark,
                            size: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 2.0, vertical: 1),
                          child: Obx(
                            () => Text(
                              '${item.quantity.value}',
                              style: Get.textTheme.bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => controller.incrementQty(item),
                          child: Icon(
                            Icons.add_circle_outline_outlined,
                            color: Get.theme.primaryColorDark,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => controller.checkout(item.sellingPrice.value),
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30.0)),
                          color: Get.theme.primaryColorDark),
                      child: Icon(
                        Icons.attach_money,
                        color: Get.theme.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
