import 'package:ebin/views/dismantlers/dismantlers_registration.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                Get.to(DismantlersRegistration());
              },
              child: const Text('open bottom sheet')),
        ),
      ),
    );
  }
}
