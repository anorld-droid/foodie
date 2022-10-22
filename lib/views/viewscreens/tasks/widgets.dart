import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/task_controller.dart';
import 'package:trice/domain/theme.dart';
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
