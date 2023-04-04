import 'package:cuisine_detail/src/controller.dart';
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
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Row(
      //       children: [
      //         Padding(
      //           padding: const EdgeInsets.all(16.0),
      //           child: Text(
      //             'Qty',
      //             style: Get.textTheme.bodyLarge
      //                 ?.copyWith(fontWeight: FontWeight.w700),
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () => controller.decrementQty(cuisineItem.basicPrice),
      //           child: Icon(
      //             Icons.do_not_disturb_on_outlined,
      //             color: Get.theme.primaryColorDark,
      //             size: 24,
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Obx(
      //             () => Text(
      //               '${controller.qty.value}',
      //               style: Get.textTheme.bodyLarge
      //                   ?.copyWith(fontWeight: FontWeight.w700),
      //             ),
      //           ),
      //         ),
      //         InkWell(
      //           onTap: () => controller.incrementQty(cuisineItem.basicPrice),
      //           child: Icon(
      //             Icons.add_circle_outline_outlined,
      //             color: Get.theme.primaryColorDark,
      //             size: 24,
      //           ),
      //         ),
      //       ],
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //       child: InkWell(
      //         onTap: () => controller.addToCart(cuisineItem),
      //         borderRadius: BorderRadius.circular(30),
      //         child: Container(
      //           alignment: AlignmentDirectional.center,
      //           height: 40,
      //           width: Get.width * 0.50,
      //           decoration: BoxDecoration(
      //               borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      //               color: Get.theme.colorScheme.background),
      //           child: Text(
      //             'ADD TO CART',
      //             style: Get.textTheme.bodySmall?.copyWith(
      //                 fontWeight: FontWeight.bold,
      //                 color: Get.theme.colorScheme.onBackground),
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
