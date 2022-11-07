import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:trice/controller/authentication/events_controller.dart';
import 'package:trice/model/events/events.dart';

class EventCard extends GetView<EventsController> {
  final EventModel eventModel;
  const EventCard({required this.eventModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<EventsController>();
    return Column(
      children: [
        Row(
          //Header: Icon, name , Badge
          children: [
            eventModel.metadata.author.profilePhoto == null
                ? Icon(
                    Icons.account_circle,
                    color: Get.theme.primaryColorDark.withAlpha(154),
                    size: 96,
                  )
                : CircleAvatar(
                    radius: 46,
                    backgroundImage:
                        NetworkImage(eventModel.metadata.author.profilePhoto!),
                  ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 4,
                ),
                Text(
                  eventModel.metadata.author.name.trim(),
                  style: Get.textTheme.bodyMedium,
                ),
                Text(
                  eventModel.metadata.date,
                  style: Get.textTheme.bodySmall,
                )
              ],
            )
          ],
        ),
        SizedBox(
          //display the images about the event in a horizontal scrollable manner
          height: 270,
          width: Get.width - 4,
          child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: eventModel.imageUrls.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.network(
                      eventModel.imageUrls[index],
                      width: Get.width - 72,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }),
        ),
        Row(
          //bottom icons: TODO
          children: [],
        )
      ],
    );
  }
}
