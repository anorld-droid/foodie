import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trice/controller/apartment_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/apartment/apartment.dart';
import 'package:trice/model/apartment/apartment_ad.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  const NotificationCard({Key? key, required this.notification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Get.theme.backgroundColor.withAlpha(240),
      margin: const EdgeInsets.only(top: 8.0, left: 12, right: 12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.text,
              style: Get.textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  notification.date,
                  style: Get.textTheme.labelMedium,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ApartmentAdCard extends GetView<ApartmentController> {
  final ApartmentAdModel apartment;
  const ApartmentAdCard({Key? key, required this.apartment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ApartmentController controller = Get.find();
    Strings str = Strings();
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      decoration: BoxDecoration(
          color: Get.theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Get.theme.primaryColorDark.withOpacity(0.25),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(2, 2), // changes position of shadow
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(12))),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          height: 270,
          width: Get.width - 32,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: apartment.imagesUrl.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.network(
                      apartment.imagesUrl[index],
                      width: Get.width - 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 4.0),
          child: Text(
            apartment.name,
            style: Get.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            apartment.location,
            style: Get.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            "Ksh.${apartment.priceRange}",
            style: Get.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0, top: 4),
          child: Text(
            "${apartment.unOccupied} unoccupied",
            style: Get.textTheme.headlineSmall
                ?.copyWith(fontWeight: FontWeight.w400),
          ),
        ),
        Center(
          child: TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 24)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side:
                              BorderSide(color: Get.theme.primaryColorDark)))),
              onPressed: () => controller.inquire(apartment.contact),
              child: Text(str.contact,
                  style: Get.textTheme.labelSmall?.copyWith(
                    color: Get.theme.primaryColorDark,
                  ))),
        ),
        const SizedBox(
          height: 8,
        )
      ]),
    );
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  GradientCircularProgressIndicator({
    required this.radius,
    required this.gradientColors,
    this.strokeWidth = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        radius: radius,
        gradientColors: gradientColors,
        strokeWidth: strokeWidth,
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.radius,
    required this.gradientColors,
    required this.strokeWidth,
  });
  final double radius;
  final List<Color> gradientColors;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    size = Size.fromRadius(radius);
    double offset = strokeWidth / 2;
    Rect rect = Offset(offset, offset) &
        Size(size.width - strokeWidth, size.height - strokeWidth);
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    paint.shader =
        SweepGradient(colors: gradientColors, startAngle: 0.0, endAngle: 2 * pi)
            .createShader(rect);
    canvas.drawArc(rect, 0.0, 2 * pi, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}