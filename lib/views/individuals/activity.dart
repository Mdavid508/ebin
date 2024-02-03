import 'package:flutter/material.dart';

class IndividualActivityPage extends StatefulWidget {
  const IndividualActivityPage({super.key});

  @override
  State<IndividualActivityPage> createState() => _IndividualActivityPageState();
}

class _IndividualActivityPageState extends State<IndividualActivityPage> {
  DateTime selectedDate = DateTime.now();
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
        body: const Center(),
      ),
    );
  }
}
