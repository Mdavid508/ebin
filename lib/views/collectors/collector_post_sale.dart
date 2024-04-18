import 'package:ebin/controllers/collectors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectorsPostSale extends StatelessWidget {
  CollectorsPostSale({super.key});

  final controller = Get.put(CollectorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            TextFormField(
              controller: controller.controllerDismantlersName,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Dismantling Point'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller.controllerPricePerKg,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Price Per Kg'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller.controllerCollectorsName,
              readOnly: true,
              decoration: const InputDecoration(labelText: 'Collectors Name'),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller.controllerDateOfVisit,
              readOnly: true,
              decoration:
                  const InputDecoration(labelText: 'Date of Site Visit'),
            ),
            const SizedBox(
              height: 16,
            ),
            Obx(
              () => FilledButton.icon(
                  onPressed: () async {
                    await controller.postSales();
                  },
                  icon: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const Icon(Icons.download_done),
                  label: const Text('Post Sale')),
            ),
          ],
        ),
      ),
    );
  }
}
