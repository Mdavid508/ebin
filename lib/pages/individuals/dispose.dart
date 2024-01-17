import 'package:flutter/material.dart';

class IndividualDisposePage extends StatefulWidget {
  const IndividualDisposePage({super.key});

  @override
  State<IndividualDisposePage> createState() => _IndividualDisposePageState();
}

class _IndividualDisposePageState extends State<IndividualDisposePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: const Text('Dispose Page'),
        ),
        body: const Column(
          children: [Text('data')],
        ));
  }
}
