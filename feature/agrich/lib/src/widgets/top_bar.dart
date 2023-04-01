import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      height: Get.height * 0.40,
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
                        'Foodie',
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
                                    color: Get.theme.colorScheme.onBackground,
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 4.0,
                                  ),
                                  Obx(
                                    () => Text(
                                      '${controller.cartItemsLength.value}',
                                      style: Get.textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
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
                  child: CustomTextField(
                    onIconTap: () async {
                      controller.search(controller.searchController.text);
                    },
                    onSubmitted: (value) async {
                      controller.search(value);
                    },
                    icon: Icons.search,
                    height: 80,
                    textStyle: Get.textTheme.bodySmall
                        ?.copyWith(fontWeight: FontWeight.w800),
                    focusNode: controller.focusNode,
                    textEditingController: controller.searchController,
                    textInputType: TextInputType.text,
                    hintText: Strings.searchHintText,
                    borderRadius: 12,
                    maxLength: 16,
                    backgroundColor: Get.theme.colorScheme.onBackground,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Get.theme.colorScheme.primary,
                      borderRadius: BorderRadius.circular(8)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: controller.favorites,
                      child: Column(
                        children: [
                          Icon(
                            Icons.local_shipping_outlined,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Track Delivery',
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.theme.colorScheme.onBackground,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: controller.recentOrders,
                      child: Column(
                        children: [
                          Icon(
                            Icons.history,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Recent orders',
                            style: Get.textTheme.bodySmall?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: controller.repeatLastOrder,
                      child: Column(
                        children: [
                          Icon(
                            Icons.find_replace,
                            color: Get.theme.colorScheme.onBackground,
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            'Repeat last order',
                            style: Get.textTheme.bodySmall?.copyWith(
                                color: Get.theme.colorScheme.onBackground,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0),
                          ),
                        ],
                      ),
                    ),
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
