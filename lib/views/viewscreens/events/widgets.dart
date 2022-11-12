import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trice/controller/authentication/events_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/events/events.dart';

class EventCard extends GetView<EventsController> {
  final EventModel eventModel;
  const EventCard({required this.eventModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<EventsController>();
    Strings str = Strings();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //Header: Icon, name , Badge
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              eventModel.metadata.author.profilePhoto == null
                  ? Icon(
                      Icons.account_circle,
                      color: Get.theme.primaryColorDark.withAlpha(154),
                      size: 48,
                    )
                  : CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                          eventModel.metadata.author.profilePhoto!),
                    ),
              const SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(eventModel.metadata.author.name.trim(),
                          style: Get.textTheme.labelSmall
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(
                        " · ",
                        style: Get.textTheme.labelSmall,
                      ),
                      Text(
                        eventModel.metadata.date,
                        style: Get.textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Flexible(
                    child: Text(
                      eventModel.description,
                      style: Get.textTheme.labelSmall,
                    ),
                  )
                ],
              )
            ],
          ),
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: [
                SvgPicture.asset(
                  str.commentSvg,
                  color: Get.theme.primaryColorDark.withOpacity(.76),
                  width: 24,
                  height: 24,
                ),
                //No. of comments
                Text(eventModel.commentsLength,
                    style: Get.textTheme.bodySmall?.copyWith(
                      color: Get.textTheme.bodySmall?.color?.withOpacity(.76),
                    ))
              ]),
              Column(
                children: [
                  Icon(
                    Icons.favorite_outlined,
                    color: Get.theme.primaryColorDark.withOpacity(.76),
                    size: 20,
                  ),
                  //No of likes
                  Text(eventModel.likesLength,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.textTheme.bodySmall?.color?.withOpacity(.76),
                      ))
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.local_fire_department,
                    color: Get.theme.primaryColorDark.withOpacity(.76),
                    size: 24,
                  ),
                  Text(eventModel.rating,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.textTheme.bodySmall?.color?.withOpacity(.76),
                      ))
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.groups,
                    color: Get.theme.primaryColorDark.withOpacity(.76),
                    size: 24,
                  ),
                  Text(eventModel.attendees,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.textTheme.bodySmall?.color?.withOpacity(.76),
                      ))
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.alternate_email,
                    color: Get.theme.primaryColorDark.withOpacity(.76),
                    size: 20,
                  ),
                  Text(str.tag,
                      style: Get.textTheme.bodySmall?.copyWith(
                        color: Get.textTheme.bodySmall?.color?.withOpacity(.76),
                      ))
                ],
              ),
            ],
          ),
        ),
        Divider(
          color: Get.theme.primaryColorDark.withAlpha(50), //color of divider
          height: 16, //height spacing of divider
          thickness: 1, //thickness of divier line
          indent: 2, //spacing at the start of divider
          endIndent: 2, //spacing at the end of divider
        )
      ],
    );
  }
}
