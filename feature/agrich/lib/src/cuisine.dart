import 'package:agrich/agrich.dart';
import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/chips.dart';
import 'package:agrich/src/widgets/list_item_no_tagline.dart';
import 'package:agrich/src/widgets/list_item_search_results.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Cuisine extends GetView<CuisineController> {
  const Cuisine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CuisineController(), fenix: true);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: _buildFAB(),
      //Floating action but
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              const CuisineTopBar(),
              controller.editing.value ||
                      controller.searchController.text.isNotEmpty ||
                      controller.selectedChip.value != 10
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
                                onChipSelected: (value) async {
                                  if (value == 9) {
                                    controller.resetSearch();
                                  } else {
                                    controller.selectedChip.value = value;
                                    controller.searchController.clear();
                                    await controller
                                        .search(Chips.values[value].name);
                                  }
                                },
                                index: index,
                              ),
                            ),
                          ),
                        ),
                        controller.searchItems.value.isEmpty &&
                                    controller.selectedChip.value != 10 ||
                                controller.searchController.text.isNotEmpty
                            ? Center(
                                child: Text(
                                  'Item not found.',
                                  style: Get.textTheme.bodyLarge,
                                ),
                              )
                            : ListItemSearchResult(
                                cuisineItems: controller.searchItems.value,
                                onTap: controller.navigateToDetails,
                              ),
                      ],
                    )
                  : SingleChildScrollView(
                      child: Column(
                        children: List.generate(
                          controller.items.value.length,
                          (index) {
                            CuisineModel cuisineModel =
                                controller.items.value[index];
                            return ListItemNoTagLine(
                              cuisineModel: cuisineModel,
                              onItemTap: controller.navigateToDetails,
                            );
                          },
                        ),
                      ),
                    )
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
            elevation: 10,
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
          ),
        ],
      ),
    );
  }
}
