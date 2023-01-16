import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/apartment/apartment.dart';
import 'package:trice/model/news/news_post.dart';
import 'package:trice/views/viewscreens/events/events.dart';
import 'package:trice/views/viewscreens/my_apartment/my_apartment.dart';
import 'package:trice/views/viewscreens/news_room/news_room.dart';
import 'package:trice/views/viewscreens/tasks/tasks.dart';
import 'package:trice/views/viewscreens/trending/trending.dart';
import 'package:trice/views/widgets/bottom_bar_notch.dart';
import 'package:trice/views/widgets/fab.dart';
import 'package:trice/views/widgets/top_bar.dart';

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

    Strings str = Strings();

    Get.put(BottomAppBarController());
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            Obx(() => controller.selectedIndex.value == 1
                ? SliverAppBar(
                    elevation: 0,
                    leading: Container(
                        padding: const EdgeInsets.only(left: 16),
                        alignment: AlignmentDirectional.center,
                        child: RichText(
                          text: TextSpan(
                            text: '\$$accountBal',
                            style: Get.textTheme.displaySmall?.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        )),
                    leadingWidth: accountBal.length <= 4
                        ? 64
                        : accountBal.length <= 6
                            ? 80
                            : 96,
                    backgroundColor: Get.theme.backgroundColor.withOpacity(.12),
                    actions: [
                      IconButton(
                          onPressed: controller.navigateToSearch,
                          icon: Icon(
                            Icons.search,
                            color: Get.theme.primaryColorDark.withAlpha(100),
                          ))
                    ],
                  )
                : const TriceTopBar())
          ];
        },
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.pageController,
          children: [
            const NewsRoom(),
            MyApartment(
              apartmentModel: ApartmentModel(
                  notifications: [
                    NotificationModel(
                        text: 'Payment due next monday', date: 'Oct 25, `22'),
                    NotificationModel(
                        text: 'Nafungua maji sai, upto 5 jioni leo, ',
                        date: 'Oct 20, `22')
                  ],
                  rent: '200k',
                  balance: '1k',
                  due: 'Dec 25, `22',
                  name: 'Imani Hostels',
                  careTaker: PostAuthor('Mjinag One',
                      'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cG9ydHJhaXR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')),
            ),
            const Tasks(),
            const Events(),
            const Trending()
          ],
        ),
      ),
      floatingActionButton: Obx(() => Visibility(
            visible: controller.fabVisible.value,
            child: _buildFab(context),
          )),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
          FABBottomAppBarItem(iconData: Icons.layers, text: str.myApartment),
          FABBottomAppBarItem(iconData: Icons.dashboard, text: str.events),
          FABBottomAppBarItem(iconData: Icons.tag, text: str.trending),
        ],
      ),
    );
  }

  Widget _buildFab(BuildContext context) {
    Strings str = Strings();
    return AnchoredOverlay(
        showOverlay: true,
        overlayBuilder: (context, offset) {
          return CenterAbout(
            position: Offset(offset.dx, offset.dy - 1 * 35.0),
            child: FabWithIcons(
              onIconTapped: controller.updateIndex,
            ),
          );
        },
        child: FloatingActionButton(
            //Floating action button on Scaffold
            onPressed: () {},
            backgroundColor: Colors.transparent,
            child: Obx(() => Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: ThemeService(isDarkMode: Get.isDarkMode).floatingABGradient,
                      boxShadow: controller.fabClicked.value
                          ? [
                              BoxShadow(
                                color: Get.theme.primaryColorDark
                                    .withOpacity(0.16),
                                spreadRadius: 0,
                                blurRadius: 8,
                                blurStyle: BlurStyle.solid,
                                offset: const Offset(
                                    0, 0), // changes position of shadow
                              ),
                            ]
                          : []),
                  child: SizedBox(
                    height: 32,
                    width: 32,
                    child: SvgPicture.asset(
                      str.todoSvg,
                      color: Colors.black,
                      fit: BoxFit.none,
                    ),
                  ),
                ))));
  }
}
