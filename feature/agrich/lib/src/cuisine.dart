import 'package:agrich/agrich.dart';
import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/widgets/list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 17.01.2023.
class Cuisine extends GetView<CuisineController> {
  const Cuisine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CuisineController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
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
              stops: const [
                0.5,
                0.8,
                1.0
              ]),
        ),
        child: Obx(
          () => Column(
            children: [
              const CuisineTopBar(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  labelColor: Get.theme.colorScheme.onBackground,
                  indicatorColor: Get.theme.colorScheme.onBackground,
                  unselectedLabelColor: Get.theme.colorScheme.onBackground,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
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
                    (index) =>
                        _bodyLayout(controller.items.value[index].header),
                  ),
                ),
              ),
            ],
          ),
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
              return Center(
                  child: GradientCircularProgressIndicator(
                gradientColors: [
                  Get.theme.colorScheme.primary,
                  Get.theme.colorScheme.background
                ],
                radius: Get.width * 0.3,
              ));
            }
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 16.0),
              shrinkWrap: true,
              itemCount: snapshot.data!.docs.length,
              padding: const EdgeInsets.all(16.0),
              itemBuilder: (context, index) => FoodieListItem(
                cuisineItem: snapshot.data!.docs[index].data(),
                header: header,
              ),
            );
          }),
    );
  }
}
