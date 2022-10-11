import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/controller/main_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/views/widgets/bottom_bar_notch.dart';
import 'package:trice/views/widgets/gradient_icon.dart';
import 'package:trice/views/widgets/top_bar.dart';

class MainScreen extends GetView<Controller> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.backgroundColor,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));
    Get.put(Controller());
    Strings str = Strings();
    BottomAppBarController bottomAppBarController = Get.find();
    return Scaffold(
      appBar: const TriceTopBar(),
      floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: null,
          backgroundColor: Colors.transparent,
          child: Obx(() => Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: ThemeService().floatingABGradient,
                    boxShadow: controller.fabClicked.value
                        ? [
                            BoxShadow(
                              color:
                                  Get.theme.primaryColorDark.withOpacity(0.37),
                              spreadRadius: 0,
                              blurRadius: 8,
                              blurStyle: BlurStyle.solid,
                              offset: const Offset(
                                  0, 0), // changes position of shadow
                            ),
                          ]
                        : []),
                child: GradientIcon(
                    onPressed: controller.selectedFab,
                    icon: SvgPicture.asset(
                      "assets/icons/todo.svg",
                      color: Colors.black,
                    ),
                    size: 32,
                    enableFeedback: false,
                    gradient: ThemeService().floatingABGradient),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Tasks',
        color: Get.theme.primaryColorDark,
        selectedColor: const Color.fromARGB(155, 0, 0, 0),
        backgroundColor: Get.theme.backgroundColor,
        notchedShape: const AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder()),
        onTabSelected: bottomAppBarController.updateIndex,
        items: [
          FABBottomAppBarItem(iconData: Icons.feed_rounded, text: 'News Room'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'My Apartment'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Events'),
          FABBottomAppBarItem(iconData: Icons.tag, text: 'Trending'),
        ],
      ),
    );
  }
}
