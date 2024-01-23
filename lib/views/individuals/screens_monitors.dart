import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MyScreensSection extends StatefulWidget {
  const MyScreensSection({super.key});

  @override
  State<MyScreensSection> createState() => _MyScreensSectionState();
}

class _MyScreensSectionState extends State<MyScreensSection> {
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
                Chip(label: Text('Laptops')),
                Chip(label: Text('Tablets')),
                Chip(label: Text('Flat Panel Display')),
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
                      'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/3tWdqRoMU63cuci1.standard',
                  categoriesHeading: 'Screens and Monitors',
                  categories: 'CRT monitors, Flat panel Display'),
              const SizedBox(
                height: 8,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyScreensList(),
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

class MyScreensList extends StatefulWidget {
  const MyScreensList({super.key});

  @override
  State<MyScreensList> createState() => _MyScreensListState();
}

class _MyScreensListState extends State<MyScreensList> {
  List<ItemScreen> items = [
    const ItemScreen(
        itemName: 'CRT monitors',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/ZiaEAG25VU1DFoRb.standard',
        eol: 5),
    const ItemScreen(
        itemName: 'Flat Panel Display',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/wM2kRyOS5RVrxUKs.standard',
        eol: 7)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Screens and Monitors")),
        body: ListView.builder(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                  builder: (context) => MyScreensItemsAddition(item: item),
                );
              },
              child: MyCategoryItemBuilder(
                image: item.url,
                itemName: item.itemName,
              ),
            );
          },
        ));
  }
}

class MyCategoryItemBuilder extends StatelessWidget {
  const MyCategoryItemBuilder(
      {super.key, required this.image, required this.itemName});

  final String image;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: MyAppColors.surfaceLightColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemName,
                  softWrap: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ontap() {}
}

class ItemScreen {
  final String itemName;
  final String url;
  final int eol;

//constructor of this class.
  const ItemScreen(
      {required this.itemName, required this.url, required this.eol});
}

//Addition to the database and display to the required page

//void function to display date picker

class MyScreensItemsAddition extends StatefulWidget {
  const MyScreensItemsAddition({super.key, required this.item});

  final ItemScreen item;

  @override
  State<MyScreensItemsAddition> createState() => _MyScreensItemsAdditionState();
}

class _MyScreensItemsAdditionState extends State<MyScreensItemsAddition> {
  DateTime selectedDate = DateTime.now();
  TextTheme textTheme = MyAppTextTheme.lightTheme;
  TextEditingController controllerItemName = TextEditingController();
  TextEditingController controllerEol = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerBrand = TextEditingController();

  @override
  void initState() {
    controllerItemName.text = widget.item.itemName;
    controllerEol.text = widget.item.eol.toString();
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
    controllerBrand.dispose();
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
          Container(
            alignment: Alignment.center,
            height: 65,
            margin: const EdgeInsets.only(bottom: 0),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
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
            padding: const EdgeInsets.all(16),
            child: Form(
                child: Column(
              children: [
                TextFormField(
                  controller: controllerItemName,
                  readOnly: true,
                  cursorColor: MyAppColors.outline,
                  decoration:
                      const InputDecoration(labelText: 'Electronic Item Name'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerEol,
                  readOnly: true,
                  decoration: const InputDecoration(labelText: 'End of Life'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
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
                  controller: controllerDate,
                  readOnly: true,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Select Date of Purchase'),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controllerBrand,
                  cursorColor: MyAppColors.outline,
                  decoration: const InputDecoration(
                    labelText: 'Enter Brand',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FilledButton(onPressed: () {}, child: const Text("Save"))
              ],
            )),
          )
        ],
      ),
    );
  }
}
