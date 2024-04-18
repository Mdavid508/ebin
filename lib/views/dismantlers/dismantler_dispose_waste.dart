import 'dart:ffi';

import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/dismantlers_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DismantlerDisposeWaste extends StatelessWidget {
  DismantlerDisposeWaste({super.key});

  final dismantlerController = Get.put(DismantlersController());
  final collectionPointController = Get.put(CollectionPointController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispose'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            TextFormField(
              controller: dismantlerController.controllerCollectionPointName,
              readOnly: true,
              decoration: const InputDecoration(
                label: Text('Collection Point'),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: dismantlerController.controllerGetDismantlersName,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: 'Dismantlers Name',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: dismantlerController.controllerWeight,
              decoration: const InputDecoration(
                labelText: 'Weight',
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => FilledButton.icon(
                  onPressed: () async {
                    await dismantlerController.updateDisposedWeight();

                    dismantlerController.controllerWeight.clear();
                  },
                  icon: dismantlerController.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.upload),
                  label: const Text('Dispose Waste')),
            ),
          ],
        ),
      ),
    );
  }
}
