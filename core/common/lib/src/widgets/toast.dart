import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 16.01.2023.
void shortToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.theme.backgroundColor,
      textColor: Get.theme.primaryColorDark,
      fontSize: 16.0);
}

void longToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Get.theme.backgroundColor,
      textColor: Get.theme.primaryColorDark,
      fontSize: 16.0);
}
