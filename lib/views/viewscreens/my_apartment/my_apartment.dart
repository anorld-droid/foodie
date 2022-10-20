import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trice/domain/strings.dart';
import 'package:trice/model/apartment.dart';
import 'package:trice/views/viewscreens/my_apartment/widgets.dart';

class MyApartment extends StatelessWidget {
  final ApartmentModel apartmentModel;
  const MyApartment({Key? key, required this.apartmentModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings str = Strings();
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            height: 32,
          ),
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 48,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 16),
                      Container(
                        alignment: AlignmentDirectional.center,
                        height: 150,
                        width: Get.width - 32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Get.theme.backgroundColor,
                            boxShadow: [
                              BoxShadow(
                                color: Get.theme.primaryColorDark
                                    .withOpacity(0.25),
                                spreadRadius: 0,
                                blurRadius: 10,
                                offset: const Offset(
                                    2, 2), // changes position of shadow
                              ),
                            ]),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 48,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(apartmentModel.name,
                                        style: Get.textTheme.labelSmall),
                                    Text(
                                      apartmentModel.careTaker.name,
                                      style: Get.textTheme.bodyLarge?.copyWith(
                                          color: Get
                                              .textTheme.labelMedium?.color
                                              ?.withAlpha(175)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 24.0),
                                  child: Text(
                                    str.rentAmount,
                                    style: Get.textTheme.labelMedium?.copyWith(
                                        color: Get.textTheme.labelMedium?.color
                                            ?.withAlpha(175)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 64.0),
                                  child: Text(
                                    str.balance,
                                    style: Get.textTheme.labelMedium?.copyWith(
                                        color: Get.textTheme.labelMedium?.color
                                            ?.withAlpha(175)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 40.0),
                                  child: Text(
                                    str.due,
                                    style: Get.textTheme.labelMedium?.copyWith(
                                        color: Get.textTheme.labelMedium?.color
                                            ?.withAlpha(175)),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 48.0),
                                  child: Text(
                                    apartmentModel.rent,
                                    style: Get.textTheme.labelSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    apartmentModel.balance,
                                    style: Get.textTheme.labelSmall,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: Text(
                                    apartmentModel.due,
                                    style: Get.textTheme.labelSmall,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              apartmentModel.careTaker.profilePhoto == null
                  ? Icon(
                      Icons.account_circle,
                      color: Get.theme.primaryColorDark.withAlpha(154),
                      size: 96,
                    )
                  : CircleAvatar(
                      radius: 46,
                      backgroundImage:
                          NetworkImage(apartmentModel.careTaker.profilePhoto!),
                    ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: Text(
                  str.notifications,
                  style: Get.textTheme.labelSmall,
                ),
              ),
            ],
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            constraints:
                BoxConstraints(minHeight: 375, maxWidth: Get.width - 32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Get.theme.backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: Get.theme.primaryColorDark.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: const Offset(2, 2), // changes position of shadow
                  ),
                ]),
            child: ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: apartmentModel.notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationCard(
                      notification: apartmentModel.notifications[index]);
                }),
          )
        ],
      ),
    ));
  }
}
