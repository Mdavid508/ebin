import 'package:ebin/constants/colors.dart';
import 'package:ebin/pages/individuals/it_equipments.dart';
import 'package:ebin/pages/individuals/others.dart';
import 'package:ebin/pages/individuals/screens_monitors.dart';
import 'package:ebin/pages/individuals/small_equipments.dart';
import 'package:flutter/material.dart';

class IndividualHomePage extends StatefulWidget {
  const IndividualHomePage({super.key});

  @override
  State<IndividualHomePage> createState() => _IndividualHomePageState();
}

class _IndividualHomePageState extends State<IndividualHomePage> {
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
                onPressed: () {},
                icon: const Icon(Icons.notifications_outlined))
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
        body: const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
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

