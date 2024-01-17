import 'package:ebin/constants/colors.dart';
import 'package:ebin/pages/individuals/navigation_menu.dart';
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
              Center(child: MyOthersDevices()),
            ],
          ),
        ),
      ),
    );
  }
}

//Tabs Section
//The widget that will contain the Screens Section.

//The widget that will contain the Small IT Devices Section.
class MyItEquipmentsSection extends StatefulWidget {
  const MyItEquipmentsSection({super.key});

  @override
  State<MyItEquipmentsSection> createState() => _MyItEquipmentsSectionState();
}

class _MyItEquipmentsSectionState extends State<MyItEquipmentsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              children: [
                Chip(label: Text('Desktop PCs')),
                Chip(label: Text('Routers')),
                Chip(label: Text('Keyboards')),
                Chip(label: Text('Smart Phones')),
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyAppColors.surfaceLightColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyCategoryContainerBuilder(
                  image:
                      'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/4Tba1Ob6xOYGVFPr.standard',
                  categoriesHeading: 'IT Equipments',
                  categories:
                      'Mobile Phones, SmartPhones, Computers, Laptops, Tablets, Fax machines, Routers, Printers and Scanners'),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text("Add Your electronic device")),
            ],
          ),
        )
      ],
    );
  }
}

//The widget that will contain the OthersDevices Section.

class MyOthersDevices extends StatefulWidget {
  const MyOthersDevices({super.key});

  @override
  State<MyOthersDevices> createState() => _MyOthersDevicesState();
}

class _MyOthersDevicesState extends State<MyOthersDevices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: [
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 16,
              children: [
                Chip(label: Text('Headphones')),
                Chip(label: Text('Radios')),
                Chip(label: Text('DVDs')),
              ],
            ),
          ]),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: MyAppColors.surfaceLightColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyCategoryContainerBuilder(
                  image:
                      'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/kjwfrwPouDBA3Xh6.standard',
                  categoriesHeading: 'Others',
                  categories:
                      'Refrigerators, Dish washing machines, Ovens, Washing Machines, Air Conditioning Equipments, Flourescent bulbs, Cameras'),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyScreensSection(),
                        ));
                  },
                  icon: const Icon(
                    Icons.add,
                    color: MyAppColors.primaryColor,
                  ),
                  label: const Text("Add Your electronic device")),
            ],
          ),
        )
      ],
    );
  }
}
