import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/model/apartment.dart';

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
