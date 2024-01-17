import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/pages/individuals/navigation_menu.dart';
import 'package:ebin/pages/individuals/screens_monitors.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

//class for storing the small equipments items.
class ItemSmallEquipment {
  final String itemName;
  final String url;
  final int eol;

  const ItemSmallEquipment(
      {required this.itemName, required this.url, required this.eol});
}

class MySmallEquipmentsList extends StatefulWidget {
  const MySmallEquipmentsList({super.key});

  @override
  State<MySmallEquipmentsList> createState() => _MySmallEquipmentsListState();
}

class _MySmallEquipmentsListState extends State<MySmallEquipmentsList> {
  List<ItemSmallEquipment> items = [
    const ItemSmallEquipment(
        itemName: 'Microwave',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/joYPDKnMa6ndYOra.standard',
        eol: 10),
    const ItemSmallEquipment(
        itemName: 'Toasters',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/IZjNOPVXbUEJTen6.standard',
        eol: 5),
    const ItemSmallEquipment(
        itemName: 'Speakers and Woofers',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/eQyrZrJCsmqMtQCe.standard',
        eol: 8),
    const ItemSmallEquipment(
        itemName: 'Headphones and Earphones',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/coLo3wyMM4q3NFSj.standard',
        eol: 2),
    const ItemSmallEquipment(
        itemName: 'Hand Mixer',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/IalmAokqNNRQnA5d.standard',
        eol: 4),
    const ItemSmallEquipment(
        itemName: 'Vaccum Cleaners',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/RhPvfMAWIFTcAcRa.standard',
        eol: 5)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Equipments'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              showMaterialModalBottomSheet(
                isDismissible: false,
                enableDrag: true,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12))),
                context: context,
                builder: (context) => MySmallEquipmentsAddition(item: item),
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

class MySmallEquipmentsAddition extends StatefulWidget {
  const MySmallEquipmentsAddition({super.key, required this.item});

  final ItemSmallEquipment item;

  @override
  State<MySmallEquipmentsAddition> createState() =>
      _MySmallEquipmentsAdditionState();
}

class _MySmallEquipmentsAdditionState extends State<MySmallEquipmentsAddition> {
  final textTheme = MyAppTextTheme.lightTheme;
  bool isButtonActive = true;
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isButtonActive = controller.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String eol = widget.item.eol.toString();
    String itemName = widget.item.itemName;
    DateTime selectedDate = DateTime.now();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Container(
              alignment: Alignment.center,
              height: 65,
              margin: const EdgeInsets.only(bottom: 0),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Electronic Item",
                    style: textTheme.titleMedium,
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close))
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: Column(
                children: [
                  TextField(
                    enabled: false,
                    cursorColor: MyAppColors.outline,
                    decoration: InputDecoration(labelText: itemName),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    enabled: false,
                    decoration: InputDecoration(labelText: '$eol Years'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  OutlinedButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2024));
                        if (dateTime != null) {
                          setState(() {
                            selectedDate = dateTime;
                          });
                        }
                      },
                      child: const Text('Select date of Purchase')),
                  Container(
                    height: 56,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border:
                            Border.all(width: 1, color: MyAppColors.outline)),
                    child: Text(selectedDate.toString()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                    cursorColor: MyAppColors.outline,
                    decoration: const InputDecoration(
                      labelText: 'Enter Brand',
                    ),
                    controller: controller,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  FilledButton(
                      onPressed: isButtonActive
                          ? () {
                              setState(() {
                                isButtonActive = false;
                                controller.clear();
                              });
                            }
                          : null,
                      child: const Text('Save')),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

//The widget that will contain the SmallEquipments Section.
class MySmallEquipmentsSection extends StatefulWidget {
  const MySmallEquipmentsSection({super.key});

  @override
  State<MySmallEquipmentsSection> createState() =>
      _MySmallEquipmentsSectionState();
}

class _MySmallEquipmentsSectionState extends State<MySmallEquipmentsSection> {
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
                          builder: (context) => const MySmallEquipmentsList(),
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
