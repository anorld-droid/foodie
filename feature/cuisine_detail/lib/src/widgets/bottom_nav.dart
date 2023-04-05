import 'package:common/common.dart';
import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:model/model.dart';

class BottomNav extends GetView<Controller> {
  final CuisineItem cuisineItem;
  const BottomNav({super.key, required this.cuisineItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.125,
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.primaryContainer,
      ),

      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Obx(
            () => Text(
              '${controller.qty.value} ${controller.qty.value > 1 ? Strings.items : Strings.item}',
              style: Get.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Get.theme.colorScheme.background),
            ),
          ),
        ),
        Obx(
          () => RichText(
            text: TextSpan(
              text: '',
              children: [
                WidgetSpan(
                  child: Transform.translate(
                      offset: const Offset(-2, -18),
                      child: Text(
                        CommonStrings.currency.toLowerCase(),
                        style: Get.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w100,
                          textBaseline: TextBaseline.alphabetic,
                          color: Get.theme.colorScheme.background,
                        ),
                      )),
                ),
                TextSpan(
                  text: controller.sellingPrice.value.toStringAsFixed(2),
                  style: Get.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.colorScheme.background),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () => controller.addToCart(cuisineItem),
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Get.theme.colorScheme.background,
                  const Color.fromARGB(181, 5, 52, 49),
                  const Color.fromARGB(71, 5, 52, 49),
                ],
                // stops: const [0.5, 0.8, 1.0],
              ),
            ),
            child: Icon(
              Icons.add_shopping_cart_outlined,
              color: Get.theme.colorScheme.onBackground,
              // size: 24,
            ),
          ),
        ),
      ]),

      // const SizedBox(
      //   height: 16.0,
      // ),
      // child:Padding(
      //   padding: const EdgeInsets.symmetric(
      //       horizontal: 16.0),
      //   child: InkWell(
      //     onTap: () =>
      //         controller.addToCart(cuisineItem),
      //     borderRadius: BorderRadius.circular(30),
      //     child: Container(
      //       alignment: AlignmentDirectional.center,
      //       height: 40,
      //       width: Get.width * 0.50,
      //       decoration: BoxDecoration(
      //           borderRadius: const BorderRadius.all(
      //               Radius.circular(12.0)),
      //           color:
      //               Get.theme.colorScheme.background),
      //       child: Text(
      //         'ADD TO CART',
      //         style: Get.textTheme.bodySmall?.copyWith(
      //             fontWeight: FontWeight.bold,
      //             color: Get
      //                 .theme.colorScheme.onBackground),
      //       ),
      //     ),
      //   ),
      // )
    );
  }
}
