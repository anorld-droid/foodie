import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/controller/authentication/events_controller.dart';
import 'package:trice/model/data/events.dart';
import 'package:trice/views/viewscreens/events/widgets.dart';

class Events extends GetView<EventsController> {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(EventsController());
    return Scaffold(
      body: ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemCount: events.length,
          itemBuilder: (BuildContext context, int index) =>
              EventCard(eventModel: events[index])),
    );
  }
}
