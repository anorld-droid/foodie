import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:trice/controller/task_controller.dart';
import 'package:trice/domain/strings.dart';

class AddTask extends GetView<TaskController> {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();
    Strings str = Strings();
    return Column(children: [
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
                  color: Get.theme.primaryColorDark.withAlpha(100), width: 1.0),
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
                      prefixIcon: Icon(
                        Icons.event,
                        color: Get.theme.primaryColorDark.withAlpha(155),
                      ),
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
                    controller: controller.timeController,
                    style: Get.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.schedule,
                        color: Get.theme.primaryColorDark.withAlpha(155),
                      ),
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
      Obx(() => Padding(
            padding: const EdgeInsets.only(
                top: 16.0, left: 8.0, right: 8.0, bottom: 16.0),
            child: DropdownSearch<String>(
              popupProps: PopupProps.menu(
                // showSearchBox: true,
                fit: FlexFit.loose,
                menuProps: const MenuProps(
                    backgroundColor: Colors.transparent, elevation: 0),
                showSelectedItems: true,
                constraints:
                    BoxConstraints(maxHeight: 250, maxWidth: Get.width),
                itemBuilder: (context, item, isSelected) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item,
                      style: isSelected
                          ? Get.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.bold)
                          : Get.textTheme.bodyMedium,
                    ),
                  );
                },
                containerBuilder: (ctx, popupWidget) {
                  return Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    decoration: BoxDecoration(
                        color: Get.theme.backgroundColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Get.theme.primaryColorDark.withOpacity(0.16),
                            spreadRadius: 0,
                            blurRadius: 8,
                            blurStyle: BlurStyle.solid,
                            offset: const Offset(
                                0, 0), // changes position of shadow
                          ),
                        ]),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Container(
                            child: popupWidget,
                          ),
                        ),
                        TextButton(
                            onPressed: controller.addFilter,
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 24)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: BorderSide(
                                            color:
                                                Get.theme.primaryColorDark)))),
                            child:
                                Text(str.add, style: Get.textTheme.labelSmall))
                      ],
                    ),
                  );
                },
              ),
              items: controller.taskModel.value.filters,
              onChanged: print,
              selectedItem: controller.dropdownValue.value,
              dropdownBuilder: ((context, selectedItem) {
                return Text(
                  selectedItem ?? "",
                  style: Get.textTheme.bodyMedium,
                );
              }),
              dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                    labelText: str.filter,
                    labelStyle: Get.textTheme.bodyLarge,
                    hintText: str.timeHintTxt,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          color: Get.theme.primaryColorDark.withAlpha(100),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                          color: Get.theme.primaryColorDark, width: 1.0),
                    ),
                    filled: true,
                    contentPadding: const EdgeInsets.all(8),
                  ),
                  baseStyle: Get.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center),
              dropdownButtonProps: DropdownButtonProps(
                  color: Get.theme.primaryColorDark, enableFeedback: true),
            ),
          )),
      InkWell(
        onTap: controller.saveTask,
        child: Container(
            margin: const EdgeInsets.only(top: 56),
            height: Get.height / 22,
            width: Get.width / 3,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: Get.theme.primaryColorDark,
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
              child: Center(
                child: Text(
                  str.save,
                  textAlign: TextAlign.center,
                  style: Get.textTheme.headlineSmall
                      ?.copyWith(color: Get.theme.backgroundColor),
                ),
              ),
            )),
      )
    ]);
  }
}
