import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/item_eol_controller.dart';

import 'package:ebin/models/category.dart';
import 'package:ebin/views/individuals/dispose_item.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/widgets/category_item_builder.dart';
import 'package:ebin/views/widgets/item_addition_bottomsheet.dart';
import 'package:ebin/views/widgets/item_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyOthersDevicesSection extends StatelessWidget {
  MyOthersDevicesSection({super.key});

  final ItemsController controller = Get.put(ItemsController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = MyAppTextTheme.lightTheme;
    return Column(
      children: [
        Row(
          children: [
            Column(
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
                  width: 328,
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
                                  builder: (context) => MyOthersList(),
                                ));
                          },
                          icon: const Icon(
                            Icons.add,
                            color: MyAppColors.primaryColor,
                          ),
                          label: const Text("Add Your electronic device")),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Expanded(
          child: Center(
            child: Obx(
              () {
                if (controller.isLoading.value == true) {
                  return const CircularProgressIndicator();
                }
                if (controller.itemData.isEmpty) {
                  return Text(
                    'Add new items to determine end of life',
                    style: textTheme.bodyMedium,
                  );
                }
                return ListView.builder(
                  // shrinkWrap: true,
                  itemCount: controller.itemData.length,
                  itemBuilder: (context, index) {
                    final item = controller.itemData[index];
                    if (item.category != ItemCategory.others) {
                      return const SizedBox.shrink();
                    }
                    return ItemDataBuilder(
                      itemName: item.itemName,
                      brandName: item.brandName,
                      eol: item.eol,
                      yearofPurchase: item.yearOfPurchase,
                    );
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class MyOthersList extends StatelessWidget {
  MyOthersList({super.key});
  final ItemsController controller = Get.put(ItemsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Others'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];

          //logic to only dispaly the others section.
          if (item.category != ItemCategory.others) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
              onTap: () {
                controller.selectedItem.value = item;
                showMaterialModalBottomSheet(
                  isDismissible: false,
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  context: context,
                  builder: (context) => ItemAdditionBottomSheet(),
                );
              },
              child: MyCategoryItemBuilder(
                  image: item.url, itemName: item.itemName));
        },
      ),
    );
  }
}

class MyOthersDisposeList extends StatelessWidget {
  MyOthersDisposeList({super.key});
  final ItemsController controller = Get.put(ItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ItemCategory.others),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];

          //Logic to filter Itequipmentslist
          if (item.category != ItemCategory.others) {
            return const SizedBox.shrink();
          }

          return GestureDetector(
            onTap: () {
              controller.selectedItem.value = item;
              Get.to(DisposeItem());
            },
            child:
                MyCategoryItemBuilder(image: item.url, itemName: item.itemName),
          );
        },
      ),
    );
  }
}
