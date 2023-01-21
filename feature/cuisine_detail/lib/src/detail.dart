import 'package:common/common.dart';
import 'package:cuisine_detail/src/controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:model/model.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class CuisineDetail extends GetView<Controller> {
  final CuisineItem cuisineItem;
  const CuisineDetail({Key? key, required this.cuisineItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => Controller());
    return Scaffold(
      body: SafeArea(
          child: NestedScrollView(headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              expandedHeight: 300.0,
              backgroundColor: Get.theme.backgroundColor,
              floating: false,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        cuisineItem.photoUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(30, 15),
                      bottomRight: Radius.elliptical(30, 15),
                    ),
                  ),
                ),
              ),
              leading: Container(
                margin: const EdgeInsets.all(8.0),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: Get.theme.backgroundColor.withOpacity(.45),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: InkWell(
                    onTap: () => Get.back(),
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    child: Icon(
                      Icons.arrow_back,
                      color: Get.theme.primaryColorDark,
                      size: 24,
                    )),
              ),
            ),
          )
        ];
      }, body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber
                // above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return _getBody();
                    },
                    childCount: 1,
                  ),
                ),
              ),
            ],
          );
        },
      ))),
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
            color: Get.theme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Qty',
                style: Get.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            InkWell(
              onTap: controller.decrementQty,
              child: Icon(
                Icons.do_not_disturb_on_outlined,
                color: Get.theme.primaryColorDark,
                size: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                () => Text(
                  '${controller.qty.value}',
                  style: Get.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            InkWell(
              onTap: controller.incrementQty,
              child: Icon(
                Icons.add_circle_outline_outlined,
                color: Get.theme.primaryColorDark,
                size: 32,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 40,
                width: Get.width * 0.50,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    color: Get.theme.primaryColorDark),
                child: Text(
                  'ADD TO CART',
                  style: Get.textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.backgroundColor),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _getBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cuisineItem.name,
                style: Get.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                cuisineItem.tag.name,
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                "${CommonStrings.currency} ${cuisineItem.price.toStringAsFixed(2)}",
                style: Get.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details',
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Obx(
                () => Text(
                  cuisineItem.detail,
                  style: Get.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.w400),
                  softWrap: true,
                  maxLines: controller.seeMore.value ? 20 : 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: InkWell(
                    onTap: () => controller.seeMore.toggle(),
                    child: Obx(
                      () => Text(
                        controller.seeMore.value ? 'SEE LESS' : 'SEE MORE',
                        style: Get.textTheme.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Nutritional Value',
                style: Get.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: Get.theme.primaryColorDark.withOpacity(.8),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Wrap(
                children: _buildNutrients(),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }

  List<Widget> _buildNutrients() {
    List<Widget> nutrientsText = [];
    for (var nutrient in cuisineItem.nutrients) {
      nutrientsText.add(Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Text(
          cuisineItem.nutrients.indexOf(nutrient) ==
                  (cuisineItem.nutrients.length - 1)
              ? '$nutrient.'
              : '$nutrient,',
          style:
              Get.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
          softWrap: true,
          maxLines: controller.seeMore.value ? 20 : 5,
          overflow: TextOverflow.ellipsis,
        ),
      ));
    }
    return nutrientsText;
  }
}