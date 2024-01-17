import 'package:ebin/constants/colors.dart';
import 'package:ebin/pages/individuals/navigation_menu.dart';
import 'package:ebin/pages/individuals/screens_monitors.dart';
import 'package:flutter/material.dart';

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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MySmallEquipmentsAddition(item: item),
              ));
            },
            child:
                MyCategoryItemBuilder(image: item.url, itemName: item.itemName),
          );
        },
      ),
    );
  }
}

class MySmallEquipmentsAddition extends StatelessWidget {
  const MySmallEquipmentsAddition({super.key, required this.item});

  final ItemSmallEquipment item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Small Equipments'),
      ),
      body: Center(
        child: Column(
          children: [Text(item.itemName), Text(item.url)],
        ),
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
