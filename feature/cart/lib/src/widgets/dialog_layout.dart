import 'package:cart/src/controller.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Created by Patrice Mulindi email(mulindipatrice00@gmail.com) on 19.01.2023.
class DialogLayout extends GetView<Controller> {
  const DialogLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<Controller>();
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                height: Get.height * 0.6,
                width: Get.width - 24,
                child: Card(
                  color: Get.theme.backgroundColor,
                  surfaceTintColor: Get.theme.backgroundColor,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.nameController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Full Name (Legal)',
                            labelText: 'Full Name',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.phoneController,
                            textInputType: TextInputType.phone,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Phone number (M-Pesa)',
                            labelText: 'Phone number',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController:
                                controller.buildingController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Building or Street name',
                            labelText: 'Building',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.floorController,
                            textInputType: TextInputType.number,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Floor No (ie. 2)',
                            labelText: 'Floor No',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController: controller.roomController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText: 'Room No (ie. G75) ',
                            labelText: 'Room No',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8),
                          child: CustomTextField(
                            textEditingController:
                                controller.landmarkController,
                            textInputType: TextInputType.name,
                            borderRadius: 8,
                            height: 48,
                            hintText:
                                'Landmark(ie. Around the airport, kisumu boys..)',
                            labelText: 'Landmark',
                            backgroundColor: Get.theme.backgroundColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            await controller.saveShippingInfo();
                          },
                          child: Container(
                              height: Get.height / 22,
                              width: Get.width / 4,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Get.theme.primaryColorDark,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30))),
                                child: Center(
                                  child: Text(
                                    'Save',
                                    textAlign: TextAlign.center,
                                    style: Get.textTheme.bodyLarge?.copyWith(
                                        color: Get.theme.backgroundColor),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
