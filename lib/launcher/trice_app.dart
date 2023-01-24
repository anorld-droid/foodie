import 'package:cart/cart.dart';
import 'package:common/common.dart';
import 'package:cuisine_detail/cuisine_detail.dart';
import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:log_in/log_in.dart';
import 'package:model/model.dart';
import 'package:sign_up/sign_up.dart';
import 'package:trice/launcher/trice_app_controller.dart';
import 'package:trice/main_screen.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 11.01.2023.
class TriceApp extends GetView<TriceAppController> {
  const TriceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut<TriceAppController>(() => TriceAppController(), fenix: true);
    return Obx(() => GetMaterialApp(
          initialBinding: TriceBinding(),
          debugShowCheckedModeBanner: false,
          theme: Themes.light,
          darkTheme: Themes.dark,
          themeMode: controller.themeMode.value,
          initialRoute: Routes.root,
          getPages: [
            GetPage(
              name: Routes.root,
              page: () => const LogIn(),
            ),
            GetPage(
              name: Routes.signupScreen,
              page: () => const SignUp(),
            ),
            GetPage(
              name: Routes.mainScreen,
              page: () => const MainScreen(),
            ),
            GetPage(
              name: Routes.cuisineDetail,
              page: () => CuisineDetail(
                cuisineItem: Get.arguments as CuisineItem,
              ),
            ),
            GetPage(
              name: Routes.cart,
              page: () => Cart(
                cartItems: Get.arguments as List<CartItem>,
              ),
            ),
          ],
        ));
  }
}
