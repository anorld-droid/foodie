import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/list_item.dart';
import 'package:agrich/src/widgets/top_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 29.04.2023.
class Body extends GetView<CuisineController> {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      decoration: BoxDecoration(color: Get.theme.colorScheme.background),
      child: Obx(
        () => Column(
          children: [
            const CuisineTopBar(),
            controller.searching.value
                ? _progressbar()
                : Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TabBar(
                          labelColor: Get.theme.colorScheme.onBackground,
                          indicatorColor: Get.theme.colorScheme.primary,
                          unselectedLabelColor:
                              Get.theme.colorScheme.onBackground,
                          isScrollable: true,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorPadding:
                              const EdgeInsets.symmetric(horizontal: 8.0),
                          controller: controller.tabController.value,
                          tabs: List.generate(
                            controller.items.value.length,
                            (index) => Tab(
                                child: Text(
                              controller.items.value[index].header,
                              style: Get.textTheme.bodySmall?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                              ),
                            )),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.695,
                        width: Get.width,
                        child: TabBarView(
                          controller: controller.tabController.value,
                          children: List.generate(
                            controller.items.value.length,
                            (index) => _bodyLayout(
                                controller.items.value[index].header),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _bodyLayout(String header) {
    return Container(
      height: Get.height * 0.695,
      width: Get.width,
      margin: const EdgeInsets.only(left: 16.0),
      child: StreamBuilder<QuerySnapshot<CuisineItem>>(
          stream: controller.getCuisineItems(header),
          builder:
              (context, AsyncSnapshot<QuerySnapshot<CuisineItem>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              _progressbar();
            }
            return snapshot.data != null
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 16.0),
                    shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    padding: const EdgeInsets.all(16.0),
                    itemBuilder: (context, index) => FoodieListItem(
                      cuisineItem: snapshot.data!.docs[index].data(),
                      header: header,
                    ),
                  )
                : const SizedBox();
          }),
    );
  }

  Widget _progressbar() => Center(
        child: Container(
          height: Get.height * 0.695,
          alignment: Alignment.center,
          color: Get.theme.colorScheme.primaryContainer,
          padding: const EdgeInsets.all(4.0),
          child: Material(
            color: Get.theme.colorScheme.primaryContainer,
            surfaceTintColor: Get.theme.colorScheme.primaryContainer,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0)
                  .animate(controller.animationController),
              child: GradientCircularProgressIndicator(
                radius: 20,
                gradientColors: [
                  Get.theme.colorScheme.primary.withAlpha(170),
                  Get.theme.colorScheme.primary,
                ],
                strokeWidth: 5.0,
              ),
            ),
          ),
        ),
      );
}
