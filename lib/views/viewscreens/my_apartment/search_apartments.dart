import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_progress_indicator/widget/gradient_progress_indicator_widget.dart';
import 'package:trice/controller/apartment_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/model/data/apartments.dart';
import 'package:trice/views/viewscreens/my_apartment/widgets.dart';

class SearchApartments extends GetView<ApartmentController> {
  const SearchApartments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<ApartmentController>();
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
              onPressed: controller.performSearch,
              icon: Icon(
                Icons.search,
                color: Get.theme.primaryColorDark.withAlpha(200),
              ))
        ],
      ),
      body: Obx(() {
        Widget widget;
        controller.searching.value
            ? widget = Center(
                child: GradientProgressIndicator(
                  radius: 80,
                  duration: 3,
                  strokeWidth: 12,
                  gradientStops: const [
                    0.4,
                    0.6,
                  ],
                  gradientColors: ThemeService().strokeColors,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        str.searching,
                        style: Get.textTheme.bodyLarge,
                      ),
                      Text(
                        str.pleaseWait,
                        style: Get.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              )
            : widget = SizedBox(
                child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: apartments.length,
                    itemBuilder: (BuildContext context, int index) =>
                        ApartmentAdCard(apartment: apartments[index])),
              );
        return widget;
      }),
    );
  }
}
