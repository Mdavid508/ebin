// ignore_for_file: must_be_immutable

import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisposeWaste extends StatelessWidget {
  DisposeWaste({super.key});

  CollectionPointController controller = Get.put(CollectionPointController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispose Waste'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                label: Text('data'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Dismantlers Name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
