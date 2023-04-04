import 'package:common/common.dart';
import 'package:cuisine_detail/src/controller.dart';
import 'package:cuisine_detail/src/strings.dart';
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
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
          gradient: RadialGradient(colors: [
            Color.fromARGB(181, 5, 52, 49),
            Color.fromARGB(71, 5, 52, 49)
          ], center: Alignment(0.5, 0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DetailTopBar(),
            const SizedBox(
              height: 8.0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cuisineItem.store,
                        style: Get.textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                            color:
                                Get.theme.colorScheme.primary.withAlpha(200)),
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: Get.height * 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * 0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: '',
                                children: [
                                  WidgetSpan(
                                    child: Transform.translate(
                                        offset: const Offset(0, -8),
                                        child: Text(
                                          CommonStrings.currency,
                                          style:
                                              Get.textTheme.bodySmall?.copyWith(
                                            fontWeight: FontWeight.w100,
                                            textBaseline:
                                                TextBaseline.alphabetic,
                                          ),
                                        )),
                                  ),
                                  TextSpan(
                                    text: controller.sellingPrice.value
                                        .toStringAsFixed(2),
                                    style: Get.textTheme.bodyMedium
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          // Obx(
                          //   () =>
                          Container(
                            decoration: BoxDecoration(
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 4.0),
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
                                        '1000',
                                        style:
                                            Get.textTheme.bodyLarge?.copyWith(
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
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width * 0.52,
                      height: Get.height * 0.5,
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.52,
                            height: Get.height * 0.5,
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
            //     Padding(
            //       padding: const EdgeInsets.all(16.0),
            //       child: Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Text(
            //             'Details',
            //             style: Get.textTheme.bodySmall?.copyWith(
            //               fontWeight: FontWeight.w100,
            //               color: Get.theme.primaryColorDark.withOpacity(.8),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 16,
            //           ),
            //           Obx(
            //             () => Text(
            //               cuisineItem.detail,
            //               style: Get.textTheme.bodyLarge
            //                   ?.copyWith(fontWeight: FontWeight.w400),
            //               softWrap: true,
            //               maxLines: controller.seeMore.value ? 20 : 5,
            //               overflow: TextOverflow.ellipsis,
            //             ),
            //           ),
            //           Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Center(
            //               child: InkWell(
            //                 onTap: () => controller.seeMore.toggle(),
            //                 child: Obx(
            //                   () => Text(
            //                     controller.seeMore.value ? 'SEE LESS' : 'SEE MORE',
            //                     style: Get.textTheme.bodySmall
            //                         ?.copyWith(fontWeight: FontWeight.w700),
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 16,
            //           ),
            //           Text(
            //             'Nutritional Value',
            //             style: Get.textTheme.bodySmall?.copyWith(
            //               fontWeight: FontWeight.w100,
            //               color: Get.theme.primaryColorDark.withOpacity(.8),
            //             ),
            //           ),
            //           const SizedBox(
            //             height: 16,
            //           ),
            //           Text(
            //             cuisineItem.nutrients,
            //             style: Get.textTheme.bodyLarge
            //                 ?.copyWith(fontWeight: FontWeight.w400),
            //             softWrap: true,
            //             maxLines: controller.seeMore.value ? 20 : 5,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //         ],
            //       ),
            //     ),
            //     const Divider()
          ],
        ),
      ),
    );
  }
}