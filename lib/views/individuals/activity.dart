import 'package:ebin/views/widgets/collectionpoint_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class IndividualActivityPage extends StatefulWidget {
  const IndividualActivityPage({super.key});

  @override
  State<IndividualActivityPage> createState() => _IndividualActivityPageState();
}

class _IndividualActivityPageState extends State<IndividualActivityPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Activities'),
          bottom: const TabBar(tabs: [
            Tab(
              text: 'Approved',
            ),
            Tab(
              text: 'Pending Approval',
            ),
          ]),
        ),
        body: Center(
          child: FilledButton(
              onPressed: () {
                showMaterialModalBottomSheet(
                  enableDrag: true,
                  shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                  context: context,
                  builder: (context) => CollectionPointBottomSheet(),
                );
              },
              child: const Text('open bottom sheet')),
        ),
      ),
    );
  }
}
