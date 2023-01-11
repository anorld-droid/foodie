import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/domain/theme.dart';
import 'package:trice/model/events/event.dart';
import 'package:trice/model/events/organizer.dart';

class EventCard extends StatefulWidget {
  final EventModel eventModel;

  const EventCard({required this.eventModel, Key? key}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool showDescription;

  @override
  void initState() {
    super.initState();
    showDescription = false;
  }

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Stack(
      alignment: AlignmentDirectional.topStart,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //Header: Icon, name , Badge
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.eventModel.metadata.author.profilePhoto == null
                      ? Icon(
                          Icons.account_circle,
                          color: Get.theme.primaryColorDark.withAlpha(154),
                          size: 48,
                        )
                      : CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(
                              widget.eventModel.metadata.author.profilePhoto!),
                        ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(widget.eventModel.metadata.author.name.trim(),
                                style: Get.textTheme.labelSmall
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text(
                              ' · ',
                              style: Get.textTheme.labelSmall,
                            ),
                            Text(
                              widget.eventModel.metadata.date,
                              style: Get.textTheme.bodySmall,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              showDescription = !showDescription;
                            });
                          },
                          child: Text(
                            widget.eventModel.description,
                            style: Get.textTheme.labelSmall,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
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
                  itemCount: widget.eventModel.imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: Image.network(
                          widget.eventModel.imageUrls[index],
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
                  InkWell(
                    onTap: () {},
                    child: Row(children: [
                      SvgPicture.asset(
                        str.commentSvg,
                        color: Get.theme.primaryColorDark.withOpacity(.76),
                        width: 24,
                        height: 24,
                      ),
                      //No. of comments
                      Text(widget.eventModel.commentsLength,
                          style: Get.textTheme.bodySmall?.copyWith(
                            color: Get.textTheme.bodySmall?.color
                                ?.withOpacity(.76),
                          ))
                    ]),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_money,
                          color: Get.theme.primaryColorDark.withOpacity(.76),
                          size: 20,
                        ),
                        //No of likes
                        Text(str.book,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.textTheme.bodySmall?.color
                                  ?.withOpacity(.76),
                            ))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.groups,
                          color: Get.theme.primaryColorDark.withOpacity(.76),
                          size: 24,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(widget.eventModel.attendees,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.textTheme.bodySmall?.color
                                  ?.withOpacity(.76),
                            ))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Icon(
                          Icons.alternate_email,
                          color: Get.theme.primaryColorDark.withOpacity(.76),
                          size: 20,
                        ),
                        Text(str.tag,
                            style: Get.textTheme.bodySmall?.copyWith(
                              color: Get.textTheme.bodySmall?.color
                                  ?.withOpacity(.76),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: Get.theme.primaryColorDark.withAlpha(50),
              //color of divider
              height: 16,
              //height spacing of divider
              thickness: 1,
              //thickness of divier line
              indent: 2,
              //spacing at the start of divider
              endIndent: 2, //spacing at the end of divider
            )
          ],
        ),
        showDescription
            ? SizedBox(
                width: Get.width,
                height: 250,
                child: Dialog(
                    backgroundColor: Colors.transparent,
                    child: ChatBubble(
                      clipper:
                          ChatBubbleClipper2(type: BubbleType.receiverBubble),
                      backGroundColor: Get.theme.backgroundColor,
                      margin: const EdgeInsets.only(top: 20),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.eventModel.description,
                            style: Get.textTheme.labelSmall,
                          ),
                        ),
                      ),
                    )),
              )
            : const SizedBox(),
      ],
    );
  }
}

class EventOrganizerCard extends StatefulWidget {
  final Organizer organizer;

  const EventOrganizerCard({Key? key, required this.organizer})
      : super(key: key);

  @override
  State<EventOrganizerCard> createState() => _EventOrganizerCardState();
}

class _EventOrganizerCardState extends State<EventOrganizerCard> {
  late List<Widget> starIcons;

  @override
  void initState() {
    super.initState();
    starIcons = iconStars(widget.organizer.rating);
  }

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      width: 220,
      height: 224,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Get.theme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Get.theme.primaryColorDark.withOpacity(0.37),
              spreadRadius: 0,
              blurRadius: 12,
              offset: const Offset(8, 0), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: starIcons),
          CircleAvatar(
              radius: 46,
              backgroundImage: NetworkImage(
                widget.organizer.imageUrl,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              widget.organizer.name,
              style: Get.textTheme.labelSmall
                  ?.copyWith(fontSize: 24, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 110,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                gradient: ThemeService().callButton,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.call,
                    color: Get.theme.primaryColorDark,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(str.call,
                      style: Get.textTheme.labelSmall?.copyWith(fontSize: 24))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> iconStars(String rate) {
  var rating = rate.split('.');
  int fullFilled = int.parse(rating.first);
  int halfFilled = int.parse(rating.last) == 5 ? 1 : 0;
  int empty = 5 - (fullFilled + halfFilled);
  List<Widget> iconStars = [];
  for (int i = 0; i < fullFilled; i++) {
    iconStars.add(Icon(
      Icons.star,
      color: Get.theme.primaryColorDark,
    ));
  }

  if (halfFilled == 1) {
    iconStars.add(Icon(
      Icons.star_half,
      color: Get.theme.primaryColorDark,
    ));
  }

  for (int k = 0; k < empty; k++) {
    iconStars.add(Icon(
      Icons.star_border_outlined,
      color: Get.theme.primaryColorDark,
    ));
  }
  return iconStars;
}
