import 'package:common/common.dart';
import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
import 'package:cuisine_detail/src/widgets/read_more.dart';
import 'package:cuisine_detail/src/widgets/restaurants.dart';
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
      decoration: BoxDecoration(color: Get.theme.colorScheme.background),
      child: Container(
        height: Get.height,
        padding: const EdgeInsets.only(left: 8.0),
        decoration: const BoxDecoration(
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  height: Get.height * 0.48,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width * 0.30,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                    child: Column(
                                      children: [
                                        Text(
                                          cuisineItem.stockTag == 1
                                              ? 'In stock'
                                              : 'Out of Stock',
                                          style:
                                              Get.textTheme.bodyLarge?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            // color:
                                            //     Get.theme.colorScheme.background,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.expand_less_outlined,
                                      color: Get.theme.colorScheme.onBackground
                                          .withOpacity(0.8),
                                      size: 32,
                                    ),
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: SizedBox(
                                    height: Get.height * 0.27,
                                    child: Column(
                                      children: const [
                                        Restaurants(
                                          'Mama Farida',
                                        ),
                                        SizedBox(
                                          height: 8.0,
                                        ),
                                        Restaurants(
                                          'Shamim',
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Icon(
                                      Icons.expand_more_outlined,
                                      color: Get.theme.colorScheme.onBackground
                                          .withOpacity(0.8),
                                      size: 32,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.52,
                        child: Stack(
                          alignment: const Alignment(1, 0.8),
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Obx(
                                () => RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: Get.textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w300,
                                    ),
                                    children: [
                                      WidgetSpan(
                                        child: Transform.translate(
                                            offset: const Offset(-4, -5.8),
                                            child: Text(
                                              'x',
                                              style: Get.textTheme.bodySmall
                                                  ?.copyWith(
                                                fontWeight: FontWeight.w100,
                                                textBaseline:
                                                    TextBaseline.alphabetic,
                                              ),
                                            )),
                                      ),
                                      TextSpan(
                                        text: '${controller.qty.value}',
                                        style: Get.textTheme.headlineSmall
                                            ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => RichText(
                        text: TextSpan(
                          text: '',
                          children: [
                            WidgetSpan(
                              child: Transform.translate(
                                  offset: const Offset(0, -12),
                                  child: Text(
                                    CommonStrings.currency.toLowerCase(),
                                    style: Get.textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w100,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                  )),
                            ),
                            TextSpan(
                              text: controller.sellingPrice.value
                                  .toStringAsFixed(2),
                              style: Get.textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Get.theme.colorScheme.onSecondary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () =>
                                controller.incrementQty(cuisineItem.basicPrice),
                            child: Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Get.theme.colorScheme.secondary),
                                borderRadius: BorderRadius.circular(30.0),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Get.theme.colorScheme.background,
                                    const Color.fromARGB(181, 5, 52, 49),
                                    const Color.fromARGB(71, 5, 52, 49),
                                  ],
                                  stops: const [0.5, 0.8, 1.0],
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Get.theme.primaryColorDark,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 4.0),
                            child: InkWell(
                              onTap: () => controller
                                  .decrementQty(cuisineItem.basicPrice),
                              child: Icon(
                                Icons.remove,
                                color: Get.theme.colorScheme.onBackground,
                                size: 28,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
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
