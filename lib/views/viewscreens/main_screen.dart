import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/model/apartment.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/events/events.dart';
import 'package:trice/views/viewscreens/my_apartment/my_apartment.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';
import 'package:trice/views/viewscreens/tasks/tasks.dart';
import 'package:trice/views/viewscreens/trending/trending.dart';
import 'package:trice/views/widgets/bottom_bar_notch.dart';
import 'package:trice/views/widgets/gradient_icon.dart';
import 'package:trice/views/widgets/top_bar.dart';

class MainScreen extends GetView<BottomAppBarController> {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      // Status bar color
      statusBarColor: Get.theme.backgroundColor,
      // Status bar brightness (optional)
      statusBarIconBrightness: Get.theme.brightness, // For Android (dark icons)
    ));

    Strings str = Strings();

    Get.put(BottomAppBarController());
    return Obx(() => Scaffold(
          appBar: controller.selectedIndex.value == 1
              ? AppBar(
                  elevation: 0,
                  backgroundColor: Get.theme.backgroundColor.withOpacity(.12),
                )
              : const TriceTopBar(),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              NewsRoom(),
              MyApartment(
                apartmentModel: ApartmentModel(
                    notifications: [
                      NotificationModel(
                          text: "Payment due next monday", date: "Oct 25, `22"),
                      NotificationModel(
                          text: "Nafungua maji sai, upto 5 jioni leo, ",
                          date: "Oct 20, `22")
                    ],
                    rent: "200k",
                    balance: "1k",
                    due: "Dec 25, `22",
                    name: "Imani Hostels",
                    careTaker: PostAuthor("Mjinag One",
                        "https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60")),
              ),
              Tasks(),
              Events(),
              Trending()
            ],
          ),
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
                                  color: Get.theme.primaryColorDark
                                      .withOpacity(0.37),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  blurStyle: BlurStyle.solid,
                                  offset: const Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ]
                            : []),
                    child: GradientIcon(
                        onPressed: () => controller.updateIndex(5),
                        icon: SvgPicture.asset(
                          str.todoSvg,
                          color: Colors.black,
                        ),
                        size: 32,
                        enableFeedback: false,
                        gradient: ThemeService().floatingABGradient),
                  ))),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          //floating action button position to center

          bottomNavigationBar: FABBottomAppBar(
            centerItemText: str.tasks,
            color: Get.theme.primaryColorDark,
            selectedColor: const Color.fromARGB(155, 0, 0, 0),
            backgroundColor: Get.theme.backgroundColor,
            notchedShape: const AutomaticNotchedShape(
                RoundedRectangleBorder(), StadiumBorder()),
            onTabSelected: controller.updateIndex,
            items: [
              FABBottomAppBarItem(iconData: Icons.feed_rounded, text: str.news),
              FABBottomAppBarItem(
                  iconData: Icons.layers, text: str.myApartment),
              FABBottomAppBarItem(iconData: Icons.dashboard, text: str.events),
              FABBottomAppBarItem(iconData: Icons.tag, text: str.trending),
            ],
          ),
        ));
  }
}
