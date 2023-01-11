import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApartmentController extends GetxController
    with GetTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  var searching = false.obs;
  late AnimationController animationController;

  @override
  void onInit() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    // _animationController.addListener(() => setState(() {}));
    animationController.repeat();
    super.onInit();
  }

  void inquire(int phoneNumber) async {
    String url = 'https://wa.me/+254$phoneNumber?text=Apartment Inquiry, ';
    Uri urlEncoded = Uri.parse(url);
    if (await canLaunchUrl(urlEncoded)) {
      await launchUrl(urlEncoded);
    } else {
      throw 'Could not launch $url';
    }
  }

  void performSearch() {
    searching.toggle();
  }
}
