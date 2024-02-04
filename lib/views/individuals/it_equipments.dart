import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/items_controller.dart';
import 'package:ebin/models/category.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/widgets/category_item_builder.dart';
import 'package:ebin/views/widgets/item_addition_bottomsheet.dart';
import 'package:ebin/views/widgets/item_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

// ignore: must_be_immutable
class MyItEquipmentsSection extends StatelessWidget {
  MyItEquipmentsSection({super.key});

  ItemsController controller = Get.put(ItemsController());

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
                  child: Wrap(
                    spacing: 8,
                    children: [
                      Chip(label: Text('Desktop PCs')),
                      Chip(label: Text('Routers')),
                      Chip(label: Text('Keyboards')),
                    ],
                  ),
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
                              'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/4Tba1Ob6xOYGVFPr.standard',
                          categoriesHeading: 'IT Equipments',
                          categories:
                              'Mobile Phones, SmartPhones, Computers, Laptops, Tablets, Fax machines, Routers, Printers and Scanners'),
                      const SizedBox(
                        height: 8,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyItEquipmentsList(),
                              ));
                        },
                        icon: const Icon(Icons.add),
                        label: const Text("Add Your electronic device"),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),

        const SizedBox(
          height: 8,
        ),
        //call the listview to build items.
        Expanded(
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
                  if (item.category != ItemCategory.itEquipments) {
                    return const SizedBox.shrink();
                  }
                  return Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 16,
                    children: [
                      ItemDataBuilder(
                        itemName: item.itemName,
                        brandName: item.brandName,
                        eol: item.eol,
                        yearofPurchase: item.yearOfPurchase,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

class MyItEquipmentsList extends StatelessWidget {
  MyItEquipmentsList({super.key});
  final ItemsController controller = Get.put(ItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ItemCategory.itEquipments),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];

          //Logic to filter Itequipmentslist
          if (item.category != ItemCategory.itEquipments) {
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
            child:
                MyCategoryItemBuilder(image: item.url, itemName: item.itemName),
          );
        },
      ),
    );
  }
}
