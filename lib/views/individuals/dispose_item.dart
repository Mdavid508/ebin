import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/items_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisposeItem extends StatelessWidget {
  DisposeItem({super.key});

  final controllerItem = Get.put(ItemsController());
  final controllerLocation = Get.put(CollectionPointController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispose Electronic Item'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controllerLocation.controllerCollectionPointName,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Collection Point Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controllerItem.controllerItemName,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Item Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: controllerItem.controllerBrand,
                decoration: const InputDecoration(
                  labelText: 'Brand Name',
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Upload a Minimum of 2 images',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 8,
                    children: [
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined),
                        label: const Text('Take Photo'),
                      ),
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.image_outlined),
                        label: const Text(' Pick from Gallery'),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Image.asset(height: 150, 'name'),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    flex: 2,
                    child: Image.asset(height: 150, 'name'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
