import 'package:ebin/views/collectors/collectors_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DismantlerActivityPage extends StatelessWidget {
  const DismantlerActivityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            Get.to(CollectorsHomePage());
          },
          child: const Text('Collector'),
        ),
      ),
    );
  }
}
