import 'package:agrich/agrich.dart';
import 'package:apartment/apartment.dart';
import 'package:common/common.dart';
import 'package:e_solar/e_solar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:hi_cars/hi_cars.dart';
import 'package:tasks/tasks.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
class MainScreen extends GetView<BottomAppBarController> {
  final String accountBal;

  const MainScreen({this.accountBal = '20.43', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.backgroundColor,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));

    Get.put(BottomAppBarController());
    return Obx(() => Scaffold(
          appBar: _buildTopBar('00.00', controller.selectedIndex.value),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              HiCars(
                height: Get.height - 112,
              ),
              const Apartment(),
              const Tasks(),
              const Cuisine(),
              const ESolar()
            ],
          ),
          floatingActionButton: _buildFab(context),

          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //floating action button position to center

          bottomNavigationBar: FABBottomAppBar(
            centerItemText: CommonStrings.tasks,
            color: Get.theme.primaryColorDark,
            selectedColor: Get.theme.primaryColorDark.withOpacity(.80),
            backgroundColor: Get.theme.backgroundColor,
            notchedShape: const AutomaticNotchedShape(
                RoundedRectangleBorder(), StadiumBorder()),
            onTabSelected: controller.updateIndex,
            items: [
              FABBottomAppBarItem(
                  iconData: Icons.snowmobile, text: CommonStrings.hiCars),
              FABBottomAppBarItem(
                  iconData: Icons.layers, text: CommonStrings.apartment),
              FABBottomAppBarItem(
                  iconData: Icons.fastfood, text: CommonStrings.cuisine),
              FABBottomAppBarItem(
                  iconData: Icons.energy_savings_leaf,
                  text: CommonStrings.eSolar),
            ],
          ),
        ));
  }

  Widget _buildFab(BuildContext context) {
    return Stack(
      children: [
        FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: () => controller.updateIndex(5),
          backgroundColor: Get.theme.backgroundColor,
          child: Obx(
            () => Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: controller.fabClicked.value
                      ? [
                          BoxShadow(
                            color: Get.theme.primaryColorDark.withOpacity(0.20),
                            spreadRadius: 0,
                            blurRadius: 8,
                            blurStyle: BlurStyle.outer,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]
                      : []),
              child: SizedBox(
                height: 32,
                width: 32,
                child: SvgPicture.asset(
                  CommonStrings.todoSvg,
                  color: Get.theme.primaryColorDark,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildTopBar(String accountBalance, int position) {
    PreferredSizeWidget preferredSizeWidget;
    switch (position) {
      case 1:
        preferredSizeWidget = ApartmentTopBar(
          accountBalance: accountBalance,
        );
        break;
      case 2:
        preferredSizeWidget = CuisineTopBar(
          accountBalance: accountBalance,
        );
        break;
      default:
        preferredSizeWidget = TriceTopBar(
          accountBalance: accountBalance,
        );
    }
    return preferredSizeWidget;
  }
}
