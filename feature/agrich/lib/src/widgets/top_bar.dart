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
        color: Get.theme.primaryColorDark,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
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
                    left: 24.0,
                    right: 24.0,
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
                      left: 24.0,
                      right: 24.0,
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
                    backgroundColor: Get.theme.colorScheme.secondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 16.0, bottom: 8.0, right: 16.0),
            child: Column(
              children: [
                InkWell(
                  onTap: controller.favorites,
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_outline,
                        color: Get.theme.colorScheme.background,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Favorites',
                        style: Get.textTheme.bodySmall?.copyWith(
                          color: Get.theme.colorScheme.background,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  color: Get.theme.colorScheme.secondary.withOpacity(.25),
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                InkWell(
                  onTap: controller.recentOrders,
                  child: Row(
                    children: [
                      Icon(
                        Icons.history,
                        color: Get.theme.colorScheme.background,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Recent orders',
                        style: Get.textTheme.bodySmall?.copyWith(
                            color: Get.theme.colorScheme.background,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Divider(
                  color: Get.theme.colorScheme.secondary.withOpacity(.25),
                  thickness: 1.5,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                InkWell(
                  onTap: controller.repeatLastOrder,
                  child: Row(
                    children: [
                      Icon(
                        Icons.find_replace,
                        color: Get.theme.colorScheme.background,
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        'Repeat last order',
                        style: Get.textTheme.bodySmall?.copyWith(
                            color: Get.theme.colorScheme.background,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
    //   return AppBar(
    //     elevation: 2,
    //     shadowColor: Get.theme.primaryColorDark.withOpacity(.35),
    //     title: CustomTextField(
    //         onIconTap: () async {
    //           controller.search(controller.searchController.text);
    //         },
    //         onSubmitted: (value) async {
    //           controller.search(value);
    //         },
    //         icon: Icons.search,
    //         height: 40,
    //         textStyle: Get.textTheme.bodySmall,
    //         focusNode: controller.focusNode,
    //         textEditingController: controller.searchController,
    //         textInputType: TextInputType.text,
    //         hintText: Strings.searchHintText,
    //         borderRadius: 30,
    //         maxLength: 16,
    //         backgroundColor: Get.theme.primaryColorDark.withOpacity(.12)),
    //     backgroundColor: Get.theme.backgroundColor,
    //     actions: [
    //       IconButton(
    //         onPressed: () async => await controller.subscriptionOptions(),
    //         icon: Icon(
    //           Icons.money_off,
    //           color: Get.theme.primaryColorDark,
    //         ),
    //         color: Get.theme.primaryColorDark,
    //       )
    //     ],
    //   );
  }
}
