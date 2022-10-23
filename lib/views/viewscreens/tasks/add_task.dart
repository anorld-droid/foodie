import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/domain/strings.dart';

class AddTask extends GetView<TaskController> {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();
    Strings str = Strings();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: TextField(
            controller: controller.taskController,
            style: Get.textTheme.bodyMedium,
            decoration: InputDecoration(
              labelText: str.task,
              labelStyle: Get.textTheme.bodyLarge,
              hintText: str.hintTaskText,
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                    color: Get.theme.primaryColorDark.withAlpha(100),
                    width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(4)),
                borderSide:
                    BorderSide(color: Get.theme.primaryColorDark, width: 1.0),
              ),
              filled: true,
              contentPadding: const EdgeInsets.all(8),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
          child: Row(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: Get.width / 2 - 16,
                    child: TextField(
                      onTap: controller.datePicker,
                      readOnly: true,
                      controller: controller.dateController,
                      style: Get.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        labelText: str.date,
                        labelStyle: Get.textTheme.bodyLarge,
                        hintText: str.dateHintTxt,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              color: Get.theme.primaryColorDark.withAlpha(100),
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              color: Get.theme.primaryColorDark, width: 1.0),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 12,
              ),
              Row(
                children: [
                  SizedBox(
                    width: Get.width / 2 - 16,
                    child: TextField(
                      onTap: controller.timePicker,
                      readOnly: true,
                      controller: controller.dateController,
                      style: Get.textTheme.bodyMedium,
                      decoration: InputDecoration(
                        labelText: str.time,
                        labelStyle: Get.textTheme.bodyLarge,
                        hintText: str.timeHintTxt,
                        enabledBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              color: Get.theme.primaryColorDark.withAlpha(100),
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(
                              color: Get.theme.primaryColorDark, width: 1.0),
                        ),
                        filled: true,
                        contentPadding: const EdgeInsets.all(8),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
