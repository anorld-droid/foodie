import 'package:agrich/agrich.dart';
import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/chips.dart';
import 'package:agrich/src/widgets/list_item.dart';
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
      //Floating action but
      body: Stack(
        children: [
          Stack(
            children: [
              Container(
                alignment: Alignment.topRight,
                height: Get.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Get.theme.colorScheme.background,
                      const Color.fromARGB(181, 5, 52, 49),
                      const Color.fromARGB(71, 5, 52, 49),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: Get.height,
            color: Get.theme.colorScheme.primaryContainer,
            child: Container(
              height: Get.height,
              decoration:
                  BoxDecoration(color: Get.theme.colorScheme.primaryContainer),
              child: SingleChildScrollView(
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
                                            controller.selectedChip.value =
                                                value;
                                            controller.searchController.clear();
                                            await controller.search(
                                                Chips.values[value].name);
                                          }
                                        },
                                        index: index,
                                      ),
                                    ),
                                  ),
                                ),
                                controller.searchItems.value.isEmpty &&
                                            controller.selectedChip.value !=
                                                10 ||
                                        controller
                                            .searchController.text.isNotEmpty
                                    ? Center(
                                        child: Text(
                                          'Item not found.',
                                          style: Get.textTheme.bodyLarge,
                                        ),
                                      )
                                    : ListItemSearchResult(
                                        cuisineItems:
                                            controller.searchItems.value,
                                        onTap: controller.navigateToDetails,
                                      ),
                              ],
                            )
                          : SingleChildScrollView(
                              child: Column(children: const [GlassRectangle()]
                                  //  List.generate(
                                  //   controller.items.value.length,
                                  //   (index) {
                                  //     CuisineModel cuisineModel =
                                  //         controller.items.value[index];
                                  //     return const GlassRectangle();
                                  //   },
                                  // ),
                                  ),
                            )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _body(List<String> tabs, List<CuisineItem> cuisineItems) {
    return Column(
      children: [
        _bodyTabView(tabs),
        TabBarView(
            controller: controller.tabController,
            children: List.generate(cuisineItems.length, (index) => null)),
      ],
    );
  }

  Widget _bodyTabView(List<String> tabs) {
    return TabBar(
      labelColor: Get.theme.colorScheme.onBackground,
      indicatorColor: Get.theme.colorScheme.onBackground,
      unselectedLabelColor: Get.theme.colorScheme.onBackground,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Get.theme.primaryColorDark,
      ),
      controller: controller.tabController,
      tabs: List.generate(
        tabs.length,
        (index) => Tab(
          text: tabs[index],
        ),
      ),
    );
  }
}
