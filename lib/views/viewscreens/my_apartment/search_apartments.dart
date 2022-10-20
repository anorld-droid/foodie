import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/apartments.dart';
import 'package:trice/views/viewscreens/my_apartment/widgets.dart';

class SearchApartments extends GetView<BottomAppBarController> {
  const SearchApartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Container(
            height: 48,
            alignment: AlignmentDirectional.centerStart,
            padding: const EdgeInsets.only(left: 16, right: 8.0),
            child: TextField(
              textAlign: TextAlign.start,
              controller: controller.searchController,
              style: Get.textTheme.bodySmall,
              scrollPadding: const EdgeInsets.all(8.0),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(12),
                hintText: str.search,
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(
                      color: Get.theme.primaryColorDark.withAlpha(100),
                      width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  borderSide:
                      BorderSide(color: Get.theme.primaryColorDark, width: 1.0),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
              ),
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Get.theme.primaryColorDark.withAlpha(100),
              ))
        ],
      ),
      body: SizedBox(
        child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: apartments.length,
            itemBuilder: (BuildContext context, int index) =>
                ApartmentAdCard(apartment: apartments[index])),
      ),
    );
  }
}
