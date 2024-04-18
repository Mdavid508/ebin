import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/item_eol_controller.dart';
import 'package:ebin/controllers/notification_controller.dart';

import 'package:ebin/views/individuals/it_equipments.dart';
import 'package:ebin/views/individuals/notifications.dart';
import 'package:ebin/views/individuals/others.dart';
import 'package:ebin/views/individuals/screens_monitors.dart';
import 'package:ebin/views/individuals/small_equipments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualHomePage extends StatefulWidget {
  const IndividualHomePage({super.key});

  @override
  State<IndividualHomePage> createState() => _IndividualHomePageState();
}

class _IndividualHomePageState extends State<IndividualHomePage> {
  final ItemsController controller = Get.put(ItemsController());
  final NotificationController notificationController =
      Get.put(NotificationController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: MyAppColors.surfaceLightColor,
          automaticallyImplyLeading: false,
          title: const Text("Add Your Electronics items"),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(() => NotificationsPage());
                },
                icon: Stack(
                  children: <Widget>[
                    const Icon(
                      Icons.notifications_outlined,
                      size: 32,
                    ),
                    Obx(
                      () => Visibility(
                        visible:
                            notificationController.unreadNotifications.value >
                                0,
                        child: Positioned(
                          bottom: 5,
                          right: 3,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: Get.theme.colorScheme.primary,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            constraints: const BoxConstraints(
                              minWidth: 15,
                              minHeight: 12,
                            ),
                            child: Text(
                              notificationController.unreadNotifications.value
                                  .toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Screens',
              ),
              Tab(
                text: 'IT Device',
              ),
              Tab(
                text: 'Small Equipments',
              ),
              Tab(
                text: 'Others',
              )
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: TabBarView(
            children: [
              Center(child: MyScreensSection()),
              Center(child: MyItEquipmentsSection()),
              Center(child: MySmallEquipmentsSection()),
              Center(child: MyOthersDevicesSection()),
            ],
          ),
        ),
      ),
    );
  }
}

//Tabs Section
//The widget that will contain the Screens Section.

//The widget that will contain the  ITEquipments Devices Section.

//The widget that will contain the OthersDevices Section.

