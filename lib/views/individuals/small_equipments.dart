import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/items_controller.dart';
import 'package:ebin/models/category.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/widgets/category_item_builder.dart';
import 'package:ebin/views/widgets/item_addition_bottomsheet.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//The widget that will contain the SmallEquipments Section.
class MySmallEquipmentsSection extends StatelessWidget {
  const MySmallEquipmentsSection({super.key});

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
                      'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/joYPDKnMa6ndYOra.standard',
                  categoriesHeading: 'Small Equipments',
                  categories:
                      'Microwaves, Toasters, Headphones, Speakers, DVD player, Hand mixer'),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MySmallEquipmentsList(),
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

class MySmallEquipmentsList extends StatelessWidget {
  MySmallEquipmentsList({super.key});
  final ItemsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Equipments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];
          //logic to filter only smallEquipments
          if (item.category != ItemCategory.smallEquipments) {
            return const SizedBox.shrink();
          }
          return GestureDetector(
            onTap: () {
              //When selected choose the selected items values
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
