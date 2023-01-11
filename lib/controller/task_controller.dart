import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/bottom_app_bar_controller.dart';
import 'package:trice/model/data/tasks.dart';
import 'package:trice/model/tasks.dart';
import 'package:trice/views/viewscreens/tasks/add_task.dart';
import 'package:trice/views/viewscreens/tasks/widgets.dart';
import 'package:date_time_format/date_time_format.dart';

class TaskController extends GetxController {
  final taskModel = tasks.obs;
  RxList<Widget> taskWidgets = <Widget>[].obs;

  var selectedChip = 0.obs;
  List<Widget> filterWidgets = <Widget>[].obs;

  final moreOptions = false.obs;

  final TextEditingController taskController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final dropdownValue = "".obs;
  final DateTime now = DateTime.now();
  @override
  void onInit() {
    super.onInit();
    dropdownValue.value = taskModel.value.filters.first;
    timeController.text = now.format('g:ia');
    dateController.text = now.format('M j, l');
    for (var filter in taskModel.value.filters) {
      filterWidgets.add(
        FilterChips(
          text: filter,
          onChipSelected: chipSelected,
          index: taskModel.value.filters.indexOf(filter),
        ),
      );
    }
    for (String date in tasks.tasks.keys) {
      taskWidgets.add(TasksLayout(
          date: date, tasks: taskModel.value.tasks[date] ?? <TaskItem>[]));
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
    bool? closed = await Get.bottomSheet<bool?>(const AddTask(),
        backgroundColor: Get.theme.backgroundColor,
        clipBehavior: Clip.hardEdge,
        elevation: 4,
        isScrollControlled: true);
    final controller = Get.find<BottomAppBarController>();
    if (closed == true) {
      controller.fabVisible.value = true;
    } else {
      controller.fabVisible.value = true;
    }
  }

  saveTask() {
    Get.back();
    //TODO: Save task either to storage or to firebase
  }

  datePicker() async {
    final DateTime? picked = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (picked != null) {
      dateController.text = picked.format('M j, l');
    }
  }

  timePicker() async {
    final picked = await showTimePicker(
        context: Get.context!, initialTime: TimeOfDay.now());
    if (picked != null) {
      var time =
          DateTime(now.year, now.month, now.day, picked.hour, picked.minute);
      timeController.text = time.format('g:ia');
    }
  }

  addFilter() {
    //TODO: Add filter to storage or firebase.
  }

  editTask(String task) {
    //TODO: Change task in storage or firebase.
    taskController.text = task;
    final controller = Get.find<BottomAppBarController>();
    controller.addTask();
  }

  deleteTask() {
    //TODO: Delete task from storage or firebase.
  }
}
