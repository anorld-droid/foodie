import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/model/tasks.dart';
import 'package:trice/views/widgets/gradient_icon.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class FilterChips extends GetView<TaskController> {
  final String text;
  final int index;
  final ValueChanged<int> onChipSelected;
  const FilterChips(
      {Key? key,
      required this.text,
      required this.onChipSelected,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();
    return InkWell(
        onTap: (() => onChipSelected(index)),
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: controller.selectedChip.value == index
                    ? Border.all(width: 0, style: BorderStyle.none)
                    : Border.all(
                        color: Get.theme.primaryColorDark,
                      ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color: controller.selectedChip.value == index
                    ? Get.theme.primaryColorDark
                    : Get.theme.backgroundColor),
            child: Text(
              text,
              style: Get.textTheme.bodyLarge?.copyWith(
                  color: controller.selectedChip.value == index
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  final double sweepAngle;

  MyPainter({required this.sweepAngle});
  @override
  void paint(Canvas canvas, Size size) {
    // Get the center of the canvas
    final center = Offset(size.width / 2, size.height / 2);

    // Draw the gray background seen on the progress indicator
    // This will act as the background layer.
    canvas.drawCircle(
      center,
      85,
      Paint()
        ..style = PaintingStyle.stroke
        ..color = Colors.black12
        ..strokeWidth = 20,
    );

    // Create a new layer where we will be painting the
    // actual progress indicator
    canvas.saveLayer(
      Rect.fromCenter(center: center, width: 200, height: 200),
      Paint(),
    );

    // Draw the light green portion of the progress indicator
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 170, height: 170),
      vmath.radians(-90),
      vmath.radians(sweepAngle * 3.6),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Get.theme.primaryColorDark
        ..strokeWidth = 20,
    );

    // Draw the dark green portion of the progress indicator
    // Basically, this covers the entire progress indicator circle.
    // But because we have set the blending mode to srouce-in (BlendMode.srcIn),
    // only the segment that is overlapping with the lighter portion will be visible.
    canvas.drawArc(
      Rect.fromCenter(center: center, width: 155, height: 155),
      vmath.radians(0),
      vmath.radians(360),
      false,
      Paint()
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Get.theme.backgroundColor
        ..strokeWidth = 15
        ..blendMode = BlendMode.srcIn,
    );
    // we fatten the layer
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class TasksLayout extends GetView<TaskController> {
  final String date;
  final List<TaskItem> tasks;
  const TasksLayout({Key? key, required this.date, required this.tasks})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              text: date,
              style: Get.textTheme.bodyMedium?.copyWith(letterSpacing: 2.5),
            ),
          ),
        ),
        ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            itemCount: tasks.length,
            itemBuilder: (BuildContext context, int index) => _TaskCard(
                  task: tasks[index],
                  date: date,
                )),
      ],
    );
  }
}

class _TaskCard extends StatefulWidget {
  final TaskItem task;
  final String date;
  const _TaskCard({
    required this.date,
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  State<_TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<_TaskCard> {
  TaskController controller = Get.find();
  Strings str = Strings();
  late bool showOptions;
  @override
  void initState() {
    super.initState();
    showOptions = false;
  }

  @override
  Widget build(BuildContext context) {
    String text = widget.task.text;
    String time = widget.task.time;
    bool done = widget.task.done;

    return Container(
      padding: const EdgeInsets.only(left: 12.0),
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GradientIcon(
                    onPressed: () {
                      setState(() {
                        done = !done;
                      });
                      controller.markTaskDone(widget.task, widget.date);
                    },
                    icon: Icon(
                      done
                          ? Icons.check_circle_outline_outlined
                          : Icons.radio_button_unchecked,
                    ),
                    size: 24,
                    gradient: ThemeService().stroke,
                  )
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 2.0, left: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: text,
                          style: Get.textTheme.bodyLarge?.copyWith(
                              decoration: done
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 2.0, bottom: 2.0, left: 8.0),
                      child: RichText(
                        text: TextSpan(
                          text: time,
                          style: Get.textTheme.labelMedium
                              ?.copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: GradientIcon(
                  onPressed: () {
                    setState(() {
                      showOptions = !showOptions;
                    });
                  },
                  icon: const Icon(Icons.more_vert),
                  size: 24,
                  gradient: ThemeService().stroke,
                ),
              )
            ],
          ),
          showOptions
              ? SizedBox(
                  width: Get.width,
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () => controller.editTask(text),
                        child: Text(str.edit, style: Get.textTheme.labelSmall),
                      ),
                      VerticalDivider(
                        color: Get.theme.primaryColorDark
                            .withAlpha(50), //color of divider
                        thickness: 1,
                        width: 32, //thickness of divier line
                        indent: 2, //spacing at the start of divider
                        endIndent: 2, //spacing at the end of divider
                      ),
                      InkWell(
                        onTap: controller.deleteTask,
                        child:
                            Text(str.delete, style: Get.textTheme.labelSmall),
                      )
                    ],
                  ),
                )
              : const SizedBox(),
          Divider(
            color: Get.theme.primaryColorDark.withAlpha(50), //color of divider
            height: 32, //height spacing of divider
            thickness: 1, //thickness of divier line
            indent: 2, //spacing at the start of divider
            endIndent: 2, //spacing at the end of divider
          ),
        ],
      ),
    );
  }
}

class MoreOptionDialog extends GetView<TaskController> {
  const MoreOptionDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>();
    Strings str = Strings();
    return Center(
      child: SizedBox(
          height: Get.height / 5,
          width: Get.width - 24,
          child: Card(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: controller.addFilter,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Get.theme.backgroundColor)))),
                  child: Text("Edit", style: Get.textTheme.labelSmall)),
              TextButton(
                  onPressed: controller.addFilter,
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 24)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                  color: Get.theme.backgroundColor)))),
                  child: Text("Delete", style: Get.textTheme.labelSmall))
            ],
          ))),
    );
  }
}

// DropdownSearch<String>(
//             popupProps: PopupProps.menu(
//               // showSearchBox: true,
//               fit: FlexFit.loose,
//               menuProps: const MenuProps(
//                   backgroundColor: Colors.transparent, elevation: 0),
//               showSelectedItems: true,
//               constraints: BoxConstraints(maxHeight: 250, maxWidth: Get.width),
//               itemBuilder: (context, item, isSelected) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     item,
//                     style: isSelected
//                         ? Get.textTheme.bodyMedium
//                             ?.copyWith(fontWeight: FontWeight.bold)
//                         : Get.textTheme.bodyMedium,
//                   ),
//                 );
//               },
//               containerBuilder: (ctx, popupWidget) {
//                 return Container(
//                   margin: const EdgeInsets.only(top: 8.0),
//                   decoration: BoxDecoration(
//                       color: Get.theme.backgroundColor,
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(8.0)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Get.theme.primaryColorDark.withOpacity(0.16),
//                           spreadRadius: 0,
//                           blurRadius: 8,
//                           blurStyle: BlurStyle.solid,
//                           offset:
//                               const Offset(0, 0), // changes position of shadow
//                         ),
//                       ]),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Flexible(
//                         child: Container(
//                           child: popupWidget,
//                         ),
//                       ),
//                       TextButton(
//                           onPressed: controller.addFilter,
//                           style: ButtonStyle(
//                               padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       vertical: 8, horizontal: 24)),
//                               shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18.0),
//                                       side: BorderSide(
//                                           color: Get.theme.backgroundColor)))),
//                           child: Text("Edit", style: Get.textTheme.labelSmall)),
//                       TextButton(
//                           onPressed: controller.addFilter,
//                           style: ButtonStyle(
//                               padding: MaterialStateProperty.all<EdgeInsets>(
//                                   const EdgeInsets.symmetric(
//                                       vertical: 8, horizontal: 24)),
//                               shape: MaterialStateProperty.all<
//                                       RoundedRectangleBorder>(
//                                   RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(18.0),
//                                       side: BorderSide(
//                                           color: Get.theme.backgroundColor)))),
//                           child:
//                               Text("Delete", style: Get.textTheme.labelSmall))
//                     ],
//                   ),
//                 );
//               },
//             ),
//             onChanged: print,
//             selectedItem: controller.dropdownValue.value,
//             dropdownBuilder: ((context, selectedItem) {
//               return Text(
//                 selectedItem ?? "",
//                 style: Get.textTheme.bodyMedium,
//               );
//             }),
//             dropdownDecoratorProps: DropDownDecoratorProps(
//                 dropdownSearchDecoration: InputDecoration(
//                   labelText: str.filter,
//                   labelStyle: Get.textTheme.bodyLarge,
//                   hintText: str.timeHintTxt,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(4)),
//                     borderSide: BorderSide(
//                         color: Get.theme.primaryColorDark.withAlpha(100),
//                         width: 1.0),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: const BorderRadius.all(Radius.circular(4)),
//                     borderSide: BorderSide(
//                         color: Get.theme.primaryColorDark, width: 1.0),
//                   ),
//                   filled: true,
//                   contentPadding: const EdgeInsets.all(8),
//                 ),
//                 baseStyle: Get.textTheme.bodyMedium,
//                 textAlign: TextAlign.center,
//                 textAlignVertical: TextAlignVertical.center),
//             dropdownButtonProps: DropdownButtonProps(
//                 color: Get.theme.primaryColorDark, enableFeedback: true),
//           ),
