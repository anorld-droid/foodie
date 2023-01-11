import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/authentication/events_controller.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/data/events.dart';
import 'package:trice/model/data/organizers.dart';
import 'package:trice/views/viewscreens/events/widgets.dart';

class Events extends GetView<EventsController> {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EventsController());
    Strings str = Strings();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            EventCard(eventModel: events[0]),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    str.organizers,
                    style: Get.textTheme.labelSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: IconButton(
                        padding: const EdgeInsets.only(right: 8),
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward,
                          color: Get.theme.primaryColorDark,
                        )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 300,
              // child: EventOrganizerCard(organizer: organizers.first),
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: organizers.length,
                  itemBuilder: (BuildContext context, int index) =>
                      EventOrganizerCard(
                        organizer: organizers[index],
                      )),
            ),
            Divider(
              color:
                  Get.theme.primaryColorDark.withAlpha(50), //color of divider
              height: 32, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 2, //spacing at the start of divider
              endIndent: 2, //spacing at the end of divider
            ),
            ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: events.length - 1,
                itemBuilder: (BuildContext context, int index) {
                  var newEventList = events.skip(1);
                  return EventCard(eventModel: newEventList.elementAt(index));
                }),
          ],
        ),
      ),
    );
  }
}
