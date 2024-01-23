import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/individuals/screens_monitors.dart';
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
  late TextEditingController controllerItemName;
  late TextEditingController controllerEol;
  TextEditingController controllerDate = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    //
    controllerItemName = TextEditingController(text: widget.item.itemName);
    controllerEol =
        TextEditingController(text: '${widget.item.eol.toString()} Years');
    controllerDate.addListener(() {
      controllerDate.text = selectedDate.year.toString();
    });

    super.initState();
  }

  @override
  void dispose() {
    controllerItemName.dispose();
    controllerEol.dispose();
    controllerDate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: Column(
              children: [
                TextField(
                  controller: controllerItemName,
                  readOnly: true,
                  cursorColor: MyAppColors.outline,
                  decoration:
                      const InputDecoration(labelText: 'Electronic item'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  readOnly: true,
                  controller: controllerEol,
                  decoration: const InputDecoration(labelText: 'End of Life '),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: controllerDate,
                  readOnly: true,
                  onTap: () async {
                    DateTime? datePicker = await showDatePicker(
                        context: context,
                        initialDate: selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030));
                    if (datePicker != null && datePicker != selectedDate) {
                      setState(() {
                        selectedDate = datePicker;
                      });
                    }
                  },
                  decoration: const InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                      ),
                      labelText: 'Select year of Purchase'),
                ),
                const SizedBox(
                  height: 16,
                ),
                const TextField(
                  cursorColor: MyAppColors.outline,
                  decoration: InputDecoration(
                    labelText: 'Enter Brand',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                FilledButton(onPressed: () {}, child: const Text('Save')),
              ],
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
