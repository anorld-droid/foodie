import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:cuisine_detail/src/widgets/read_more.dart';
import 'package:cuisine_detail/src/widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:model/model.dart';

class DetailBody extends GetView<Controller> {
  final CuisineItem cuisineItem;
  const DetailBody({super.key, required this.cuisineItem});

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          color: Get.theme.colorScheme.background),
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.only(left: 8.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          gradient: RadialGradient(colors: [
            Color.fromARGB(181, 5, 52, 49),
            Color.fromARGB(71, 5, 52, 49)
          ], center: Alignment(0.5, 0)),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DetailTopBar(),
              const SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cuisineItem.store,
                      style: Get.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Get.theme.colorScheme.primary.withAlpha(200)),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      cuisineItem.name,
                      style: Get.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Get.theme.colorScheme.onBackground,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: Get.height * 0.45,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.35,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      color: Get.theme.colorScheme.onSecondary),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          width: 6.0,
                                        ),
                                        const Icon(
                                          Icons.favorite,
                                          color: Color(0xFFea2962),
                                        ),
                                        const SizedBox(
                                          width: 6.0,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '${cuisineItem.favorites.length}',
                                              style: Get.textTheme.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                // color:
                                                //     Get.theme.colorScheme.background,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 6.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                    color: Get.theme.colorScheme.onSecondary,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(
                                          width: 6.0,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              cuisineItem.stockTag == 1
                                                  ? 'In stock'
                                                  : 'Out of Stock',
                                              style: Get.textTheme.bodyLarge
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w400,
                                                // color:
                                                //     Get.theme.colorScheme.background,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 6.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 100,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Get.theme.colorScheme.onSecondary),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () => controller
                                        .incrementQty(cuisineItem.basicPrice),
                                    child: Container(
                                      padding: const EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Get
                                                .theme.colorScheme.secondary),
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Get.theme.colorScheme.background,
                                            const Color.fromARGB(
                                                181, 5, 52, 49),
                                            const Color.fromARGB(71, 5, 52, 49),
                                          ],
                                          stops: const [0.5, 0.8, 1.0],
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.add,
                                        color: Get.theme.primaryColorDark,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8.0),
                                    child: InkWell(
                                      onTap: () => controller
                                          .decrementQty(cuisineItem.basicPrice),
                                      child: Transform.rotate(
                                        angle: 90 * 3.1415926535897932 / 180,
                                        child: Icon(
                                          Icons.remove,
                                          color: Get
                                              .theme.colorScheme.onBackground,
                                          size: 28,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.52,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width * 0.52,
                              height: Get.height * 0.45,
                              decoration: BoxDecoration(
                                color: Get.theme.colorScheme.primaryContainer,
                                image: DecorationImage(
                                    image: NetworkImage(
                                      cuisineItem.photoUrl,
                                    ),
                                    fit: BoxFit.contain),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //     const Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Strings.description,
                      style: Get.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ReadMoreText(
                      cuisineItem.detail,
                      trimLines: 3,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      Strings.nutritionalValue,
                      style: Get.textTheme.bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w800),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    ReadMoreText(
                      cuisineItem.nutrients,
                      trimLines: 3,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
              //     const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
