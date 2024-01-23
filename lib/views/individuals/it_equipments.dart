import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/individuals/screens_monitors.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ItemItEquipment {
  final String itemName;
  final String url;
  final int eol;

  const ItemItEquipment({
    required this.itemName,
    required this.url,
    required this.eol,
  });
}

class MyItEquipmentsSection extends StatefulWidget {
  const MyItEquipmentsSection({super.key});

  @override
  State<MyItEquipmentsSection> createState() => _MyItEquipmentsSectionState();
}

class _MyItEquipmentsSectionState extends State<MyItEquipmentsSection> {
  List<ItemItEquipment> items = [];

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
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyItEquipmentsList(),
                        ));
                  },
                  icon: const Icon(Icons.add),
                  label: const Text("Add Your electronic device")),
            ],
          ),
        )
      ],
    );
  }
}

class MyItEquipmentsList extends StatefulWidget {
  const MyItEquipmentsList({super.key});

  @override
  State<MyItEquipmentsList> createState() => _MyItEquipmentsListState();
}

class _MyItEquipmentsListState extends State<MyItEquipmentsList> {
  List<ItemItEquipment> items = [
    const ItemItEquipment(
        itemName: 'Smart Phones',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/4Tba1Ob6xOYGVFPr.standard',
        eol: 4),
    const ItemItEquipment(
        itemName: "computers",
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/ZIOFkHSxJKUAXbok.standard',
        eol: 5),
    const ItemItEquipment(
        itemName: 'Laptop',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/2Fw5b5NJLuVgHZT5.standard',
        eol: 5),
    const ItemItEquipment(
        itemName: 'Tablets',
        url:
            'https://imgs.search.brave.com/cBBCwsWwT1ulkeG_U8fcGaO1Hdm7egpRgi74UY5KQd8/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9waXNj/ZXMuYmJ5c3RhdGlj/LmNvbS9pbWFnZTIv/QmVzdEJ1eV9VUy9H/YWxsZXJ5L1NPTC02/ODc5Mi1UYWJsZXRz/QnV5aW5nR3VpZGUt/QnJhbmRzLVNhbXN1/bmctMTc4NDk2Lmpw/Zw',
        eol: 7),
    const ItemItEquipment(
        itemName: 'Printers',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/2DMFPrRlCPd5aSdQ.standard',
        eol: 7),
    const ItemItEquipment(
        itemName: 'Routerss',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/jVgpFGL5aFDjjGjR.standard',
        eol: 7),
    const ItemItEquipment(
        itemName: 'Fax Machines',
        url:
            'https://d17kynu4zpq5hy.cloudfront.net/igi/ric/1dvFccM53YUUkoT5.standard',
        eol: 7)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Equipments'),
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
                builder: (context) => MyItEquipmentsAddition(item: item),
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

class MyItEquipmentsAddition extends StatefulWidget {
  const MyItEquipmentsAddition({super.key, required this.item});
  final ItemItEquipment item;

  @override
  State<MyItEquipmentsAddition> createState() => _MyItEquipmentsAdditionState();
}

class _MyItEquipmentsAdditionState extends State<MyItEquipmentsAddition> {
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
    controllerEol.dispose();
    controllerBrand.dispose();
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
          Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            alignment: Alignment.center,
            height: 65,
            margin: const EdgeInsets.only(bottom: 0),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.black))),
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
          //where we will have the textformfield
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
