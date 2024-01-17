import 'package:flutter/material.dart';

class IndividualActivityPage extends StatefulWidget {
  const IndividualActivityPage({super.key});

  @override
  State<IndividualActivityPage> createState() => _IndividualActivityPageState();
}

class _IndividualActivityPageState extends State<IndividualActivityPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text("Activity page"),
      ),
    );
  }
}