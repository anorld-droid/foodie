import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/views/viewscreens/tasks/widgets.dart';

class TaskController extends GetxController {
  final List<String> filters;
  TaskController({required this.filters});

  var selectedChip = 0.obs;
  List<Widget> filterWidgets = <Widget>[].obs;

  @override
  void onInit() {
    super.onInit();
    for (var filter in filters) {
      filterWidgets.add(
        FilterChips(
          text: filter,
          onChipSelected: chipSelected,
          index: filters.indexOf(filter),
        ),
      );
    }
  }

  chipSelected(int index) {
    selectedChip.value = index;
  }
}
