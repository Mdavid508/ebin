import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/it_equipments.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/individuals/others.dart';
import 'package:ebin/views/individuals/screens_monitors.dart';
import 'package:ebin/views/individuals/small_equipments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisposeItemCategory extends StatelessWidget {
  const DisposeItemCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Disposal Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(MyScreensDisposeList());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                  width: 328,
                  decoration: BoxDecoration(
                    color: MyAppColors.surfaceLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCategoryContainerBuilder(
                          image:
                              'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/3tWdqRoMU63cuci1.standard',
                          categoriesHeading: 'Screens and Monitors',
                          categories: 'CRT monitors, Flat panel Display'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MyItEquipmentsDisposeList());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                  width: 328,
                  decoration: BoxDecoration(
                    color: MyAppColors.surfaceLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCategoryContainerBuilder(
                          image:
                              'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/4Tba1Ob6xOYGVFPr.standard',
                          categoriesHeading: 'IT Equipments',
                          categories:
                              'Mobile Phones, SmartPhones, Computers, Laptops, Tablets, Fax machines, Routers, Printers and Scanners'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MySmallEquipmentsDisposeList());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                  width: 328,
                  decoration: BoxDecoration(
                    color: MyAppColors.surfaceLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCategoryContainerBuilder(
                          image:
                              'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/joYPDKnMa6ndYOra.standard',
                          categoriesHeading: 'Small Equipments',
                          categories:
                              'Microwaves, Toasters, Headphones, Speakers, DVD player, Hand mixer'),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(MyOthersDisposeList());
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                  width: 328,
                  decoration: BoxDecoration(
                    color: MyAppColors.surfaceLightColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyCategoryContainerBuilder(
                          image:
                              'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/kjwfrwPouDBA3Xh6.standard',
                          categoriesHeading: 'Others',
                          categories:
                              'Refrigerators, Dish washing machines, Ovens, Washing Machines, Air Conditioning Equipments, Flourescent bulbs, Cameras'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryBuilder extends StatelessWidget {
  const CategoryBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
      width: 328,
      decoration: BoxDecoration(
        color: MyAppColors.surfaceLightColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCategoryContainerBuilder(
              image:
                  'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/3tWdqRoMU63cuci1.standard',
              categoriesHeading: 'Screens and Monitors',
              categories: 'CRT monitors, Flat panel Display'),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
