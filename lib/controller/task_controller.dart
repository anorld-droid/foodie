import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/model/data/tasks.dart';
import 'package:trice/model/tasks.dart';
import 'package:trice/views/viewscreens/tasks/add_task.dart';
import 'package:trice/views/viewscreens/tasks/widgets.dart';

class TaskController extends GetxController {
  final List<String> filters;
  TaskController({required this.filters});

  final taskModel = tasks.obs;
  RxList<Widget> taskWidgets = <Widget>[].obs;

  var selectedChip = 0.obs;
  List<Widget> filterWidgets = <Widget>[].obs;

  final TextEditingController taskController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
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
    for (String date in tasks.tasks.keys) {
      taskWidgets.add(TasksLayout(
          date: date,
          tasks: taskModel.value.tasks[date]?.obs ?? <TaskItem>[].obs));
    }
  }

  chipSelected(int index) {
    selectedChip.value = index;
  }

  markTaskDone(TaskItem task, String key) async {
    task.done = !task.done;
    taskWidgets.refresh();
  }

  addTask() async {
    bool? closed = await Get.bottomSheet<bool?>(
      const AddTask(),
      backgroundColor: Get.theme.backgroundColor,
      clipBehavior: Clip.hardEdge,
      elevation: 4,
    );
    final controller = Get.find<BottomAppBarController>();
    if (closed == true) {
      controller.fabVisible.value = true;
    } else {
      controller.fabVisible.value = true;
    }
  }

  datePicker() {
    DatePickerDialog(
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now());
  }

  timePicker() async {
    // TimePickerDialog(initialTime: );
    final TimeOfDay? picked = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.dial,
        context: Get.context!,
        initialTime: TimeOfDay.now());
    if (picked != null) {
      timeController.text = "${picked.hour}${picked.hour}hrs";
    }
  }
}
