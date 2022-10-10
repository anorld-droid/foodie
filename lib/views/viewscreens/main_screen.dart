import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
    return Scaffold(
      appBar: const TriceTopBar(),
      floatingActionButton: FloatingActionButton(
          //Floating action button on Scaffold
          onPressed: () => controller.selectedTab(5),
          backgroundColor: Colors.transparent,
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: ThemeService().floatingABGradient),
            child: GradientIcon(() {},
                icon: SvgPicture.asset(
                  "assets/icons/todo.svg",
                  color: Colors.black,
                ),
                size: 32,
                enableFeedback: false,
                gradient: ThemeService().floatingABGradient),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floating action button position to center

      bottomNavigationBar: FABBottomAppBar(
        centerItemText: 'Tasks',
        color: Get.theme.primaryColorDark,
        selectedColor: const Color.fromARGB(155, 0, 0, 0),
        backgroundColor: Get.theme.backgroundColor,
        notchedShape: const AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder()),
        onTabSelected: controller.selectedTab,
        items: [
          FABBottomAppBarItem(iconData: Icons.feed_rounded, text: 'News Room'),
          FABBottomAppBarItem(iconData: Icons.layers, text: 'Apartment'),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: 'Events'),
          FABBottomAppBarItem(iconData: Icons.tag, text: 'Trending'),
        ],
      ),
    );
  }
}
