import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/individuals/screens_monitors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ItemOthers {
  final String itemName;
  final String url;
  final int eol;

  const ItemOthers(
      {required this.itemName, required this.url, required this.eol});
}

class MyOthersDevicesSection extends StatefulWidget {
  const MyOthersDevicesSection({super.key});

  @override
  State<MyOthersDevicesSection> createState() => _MyOthersDevicesSectionState();
}

class _MyOthersDevicesSectionState extends State<MyOthersDevicesSection> {
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
                          builder: (context) => const MyOthersList(),
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

class MyOthersList extends StatefulWidget {
  const MyOthersList({super.key});

  @override
  State<MyOthersList> createState() => _MyOthersListState();
}

class _MyOthersListState extends State<MyOthersList> {
  List<ItemOthers> items = [
    const ItemOthers(
        itemName: 'Refrigerators',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/OTobQvcACkEOXqnt.standard',
        eol: 15),
    const ItemOthers(
        itemName: 'Flourescent Bulbs',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/TO2KOKWCQwErIOIB.standard',
        eol: 7),
    const ItemOthers(
        itemName: 'Dishwasher',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/SWNvLX2OPtwbZQEm.standard',
        eol: 12),
    const ItemOthers(
        itemName: 'Oven',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/B3RClyjOcIQPEupb.standard',
        eol: 15),
    const ItemOthers(
        itemName: 'Washing Machine',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/xsTFtlYMMNelKanL.standard',
        eol: 12),
    const ItemOthers(
        itemName: 'Air Conditioning Equipments',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/NjHtoJkyHUqiXAa5.standard',
        eol: 12),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Others'),
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
                  builder: (context) => MyOthersItemsAddition(item: item),
                );
              },
              child: MyCategoryItemBuilder(
                  image: item.url, itemName: item.itemName));
        },
      ),
    );
  }
}

class MyOthersItemsAddition extends StatefulWidget {
  const MyOthersItemsAddition({super.key, required this.item});
  final ItemOthers item;

  @override
  State<MyOthersItemsAddition> createState() => _MyOthersItemsAdditionState();
}

class _MyOthersItemsAdditionState extends State<MyOthersItemsAddition> {
  TextTheme textTheme = MyAppTextTheme.lightTheme;
  DateTime selectedDate = DateTime.now();
  TextEditingController controllerItemName = TextEditingController();
  TextEditingController controllerEol = TextEditingController();
  TextEditingController controllerDate = TextEditingController();
  TextEditingController controllerBrand = TextEditingController();

  @override
  void initState() {
    controllerItemName.text = widget.item.itemName;
    controllerEol.text = widget.item.eol.toString();
    controllerBrand.text = '';
    controllerDate.addListener(() {
      controllerDate.text = selectedDate.year.toString();
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerItemName.dispose();
    controllerBrand.dispose();
    controllerDate.dispose();
    controllerEol.dispose();
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
