import 'dart:ui';

import 'package:agrich/src/cuisine_controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class FoodieListItem extends GetView<CuisineController> {
  final CuisineItem cuisineItem;
  const FoodieListItem({super.key, required this.cuisineItem});

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return InkWell(
      onTap: () => controller.navigateToDetails(cuisineItem),
      child: Stack(
        children: [
          ClipPath(
            clipper: RightConcaveClipper(),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  width: 160,
                  height: 270,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Get.theme.colorScheme.onSurface.withOpacity(0.4),
                        Get.theme.colorScheme.onSurface.withOpacity(0.2),
                      ],
                      begin: AlignmentDirectional.topStart,
                      end: AlignmentDirectional.bottomEnd,
                    ),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                        bottomRight: Radius.circular(6)),
                    border: Border.all(
                      width: 1.5,
                      color:
                          Get.theme.colorScheme.onBackground.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            color: Get.theme.colorScheme.primaryContainer,
                            image: DecorationImage(
                                image: NetworkImage(
                                  cuisineItem.photoUrl,
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, left: 8.0),
                        child: Text(
                          cuisineItem.name,
                          softWrap: true,
                          style: Get.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w800),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 4.0),
                        child: Text(
                          cuisineItem.store,
                          softWrap: true,
                          style: Get.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.w300),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 12,
            right: 20,
            child: Container(
                decoration: BoxDecoration(
                    color: Get.theme.colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                  onPressed: () => controller.addToCart(cuisineItem),
                  icon: Icon(
                    Icons.add_shopping_cart_outlined,
                    color: Get.theme.colorScheme.background,
                  ),
                )),
          ),
          Positioned(
            bottom: 27,
            left: 10,
            child: Obx(
              () => Text(
                '${CommonStrings.currency} ${cuisineItem.sellingPrice.value[controller.store.value]!.toStringAsFixed(2)}',
                style: Get.textTheme.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RightConcaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..cubicTo(size.width, size.height - 8, size.width, size.height - 8,
          size.width - 30, size.height - 8)
      ..cubicTo(size.width - 65, size.height - 8, size.width - 65,
          size.height - 65, size.width - 30, size.height - 65)
      ..cubicTo(size.width, size.height - 65, size.width, size.height - 80,
          size.width, size.height - 80)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);
  }

  @override
  bool shouldReclip(CustomClipper<dynamic> oldClipper) {
    return oldClipper != this;
  }
}
