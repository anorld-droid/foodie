import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/model/data/tasks.dart';

class Tasks extends GetView<TaskController> {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      TaskController(
        filters: tasks.filters,
      ),
    );
    return Scaffold(
        body: Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: controller.filterWidgets,
          ),
        )
      ],
    ));
  }
}
