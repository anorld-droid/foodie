import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ApartmentController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var searching = false.obs;
  inquire(int phoneNumber) async {
    String url = "https://wa.me/+254$phoneNumber?text=Apartment Inquiry, ";
    Uri urlEncoded = Uri.parse(url);
    if (await canLaunchUrl(urlEncoded)) {
      await launchUrl(urlEncoded);
    } else {
      throw "Could not launch $url";
    }
  }

  performSearch() {
    searching.toggle();
  }
}
