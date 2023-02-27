import 'package:agrich/src/cuisine_controller.dart';
import 'package:agrich/src/strings.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubscriptionLayout extends GetView<CuisineController> {
  const SubscriptionLayout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CuisineController>();
    return SizedBox(
      height: Get.height * 0.97,
      child: Column(
        children: [
          Container(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                onPressed: Get.back<void>,
                icon: Icon(
                  Icons.close,
                  color: Get.theme.primaryColorDark,
                ),
              )),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.06),
            child: SizedBox(
              width: Get.width * 0.9,
              child: Card(
                color: Get.theme.backgroundColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                shadowColor: Get.theme.primaryColorDark.withOpacity(.35),
                child: TabBar(
                  labelColor: Get.theme.backgroundColor,
                  indicatorColor: Get.theme.backgroundColor,
                  unselectedLabelColor: Get.theme.primaryColorDark,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Get.theme.primaryColorDark,
                  ),
                  controller: controller.tabController,
                  tabs: const [
                    Tab(
                      text: 'Free',
                    ),
                    Tab(
                      text: 'Platinum',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Get.height * 0.1),
            child: SizedBox(
              height: Get.height * 0.48,
              width: Get.width * 0.8,
              child: Container(
                decoration: BoxDecoration(
                  color: Get.theme.backgroundColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Get.theme.primaryColorDark.withOpacity(.35),
                      spreadRadius: 1.0,
                      blurRadius: 3.0,
                      blurStyle: BlurStyle.inner,
                    )
                  ],
                ),
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    _tabViewLayout(
                      '0',
                      [
                        'Home Town delivery',
                      ],
                    ),
                    _tabViewLayout(
                      '6000',
                      [
                        'Personalized meal options',
                        'Hire professional chef',
                        'Free delivery',
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabViewLayout(String price, List<String> offers) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                CommonStrings.currency,
                style: Get.textTheme.labelSmall,
              ),
              Text(
                price,
                style: Get.textTheme.headlineMedium,
              ),
              price == '0'
                  ? const SizedBox()
                  : Text(
                      Strings.term,
                      style: Get.textTheme.bodyLarge,
                    ),
            ],
          ),
        ),
        Column(
          children: [
            for (var text in offers)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: Get.textTheme.bodyLarge,
                  softWrap: true,
                  overflow: TextOverflow.clip,
                ),
              ),
          ],
        ),
        price == '0'
            ? const SizedBox()
            : controller.accountType.value == price
                ? const SizedBox()
                : InkWell(
                    onTap: () => controller.upgradeAccount(
                      price,
                      price == '3000' ? 'Platinum' : 'Gold',
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: AlignmentDirectional.center,
                          height: 40,
                          width: Get.width * 0.45,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                            color: Get.theme.primaryColorDark,
                          ),
                          child: Text(
                            'Upgrade',
                            style: Get.textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Get.theme.backgroundColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
      ],
    );
  }
}
