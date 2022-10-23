import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/model/data/tasks.dart';
import 'package:trice/model/tasks.dart';
import 'package:trice/views/viewscreens/tasks/widgets.dart';

class Tasks extends GetView<TaskController> {
  final TaskModel taskModel;
  const Tasks({required this.taskModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(
      TaskController(
        filters: tasks.filters,
      ),
    );
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.filterWidgets,
            ),
          ),
          const SizedBox(
            height: 64,
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: CustomPaint(
              painter: MyPainter(sweepAngle: 78),
              child: Center(
                child: Text(
                  "78%",
                  style: Get.textTheme.bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
          Column(
            children: controller.taskWidgets,
          ),
        ],
      ),
    ));
  }
}
