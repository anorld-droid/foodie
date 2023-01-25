import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/chips.dart';
import 'package:agrich/src/widgets/list_item_no_tagline.dart';
import 'package:agrich/src/widgets/list_item_search_results.dart';
import 'package:agrich/src/widgets/list_item_with_tagline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Cuisine extends GetView<CuisineController> {
  const Cuisine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _buildFAB(),
      //Floating action but
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.editing.value ||
                      controller.searchController.text.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Wrap(
                            children: List.generate(
                              Chips.values.length,
                              (index) => TriceFilterChips(
                                text: Chips.values[index].name,
                                onChipSelected: (value) {
                                  controller.selectedChip.value = value;
                                  controller.search(Chips.values[value].name);
                                },
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        ListItemSearchResult(
                          cuisineItems: controller.searchItems.value,
                          onTap: controller.navigateToDetails,
                        ),
                      ],
                    )
                  : ListView.builder(
                      key: Key(controller.items.value.length.toString()),
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.items.value.length,
                      itemBuilder: (BuildContext context, int index) {
                        CuisineModel cuisineModel =
                            controller.items.value[index];
                        if (index % 2 == 0) {
                          return ListItemWithTagLine(
                              cuisineModel: cuisineModel,
                              onItemTap: controller.navigateToDetails);
                        } else {
                          return ListItemNoTagLine(
                            cuisineModel: cuisineModel,
                            onItemTap: controller.navigateToDetails,
                          );
                        }
                      }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAB() {
    return FittedBox(
      child: Stack(
        alignment: const Alignment(1.4, -2.4),
        children: [
          FloatingActionButton(
            enableFeedback: true,
            heroTag: 'Cart Button',
            onPressed: controller.navigateToCart,
            backgroundColor: Get.theme.backgroundColor,
            child: Icon(
              Icons.shopping_cart,
              color: Get.theme.primaryColorDark,
              size: 32,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            constraints: const BoxConstraints(minHeight: 32, minWidth: 32),
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
              child: Obx(
                () => Text(
                  '${controller.cartItemsLength.value}',
                  style: Get.textTheme.bodyMedium!
                      .copyWith(color: Get.theme.primaryColorDark),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
