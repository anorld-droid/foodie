import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class CuisineTopBar extends GetView<CuisineController> {
  const CuisineTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return Container(
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: Get.height * 0.06,
                    left: 10.0,
                    right: 10.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        Strings.appName,
                        style: Get.textTheme.headlineLarge,
                      ),
                      InkWell(
                          onTap: controller.navigateToCart,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Get.theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 7.0, horizontal: 10.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Get.theme.colorScheme.onPrimary,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Obx(
                                    () => Text(
                                      '${controller.cartItemsLength.value}',
                                      style: Get.textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: Get.theme.colorScheme.onPrimary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: Get.height * 0.01,
                      left: 10.0,
                      right: 10.0,
                      bottom: Get.height * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width * 0.80,
                        child: CustomTextField(
                          onIconTap: () async {
                            controller.search(controller.searchController.text);
                          },
                          onSubmitted: (value) async {
                            controller.search(value);
                          },
                          icon: Icons.search,
                          height: 80,
                          textStyle: Get.textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                          focusNode: controller.focusNode,
                          textEditingController: controller.searchController,
                          textInputType: TextInputType.text,
                          hintText: Strings.searchHintText,
                          borderRadius: 12,
                          textColor: Get.theme.colorScheme.onBackground,
                          maxLength: 16,
                          backgroundColor: Get.theme.colorScheme.surface,
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Get.theme.colorScheme.surface,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: PopupMenuButton<String>(
                          onSelected: controller.quickOptions,
                          position: PopupMenuPosition.under,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          color: Get.theme.colorScheme.background,
                          itemBuilder: (_) {
                            return Strings.quickItems.map((choice) {
                              return PopupMenuItem(
                                value: choice,
                                child: choice == 'Track delivery'
                                    ? ExpansionTile(
                                        title: Text(
                                          choice,
                                          style: Get.textTheme.bodyLarge,
                                        ),
                                        expandedAlignment: Alignment.topLeft,
                                        children: controller.orders.value
                                            .map((order) {
                                          return InkWell(
                                            onTap: () => controller
                                                .navigateToDelivery(order),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                '${order.id}',
                                                style: Get.textTheme.bodyLarge,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    : Text(
                                        choice,
                                        style: Get.textTheme.bodyLarge,
                                      ),
                              );
                            }).toList();
                          },
                          child: Icon(
                            Icons.unfold_more_double_outlined,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
