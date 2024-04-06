import 'dart:io';

import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/item_eol_controller.dart';

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
                'Upload a Minimum 2 images and 3 images Max',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      controllerLocation.selectImages();
                    },
                    icon: const Icon(Icons.image_outlined),
                    label: const Text(' Pick from Gallery'),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Clear')),
                ],
              ),
              Column(
                children: [
                  Obx(
                    () => GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: controllerLocation.selectedFileCount.value,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Image.file(
                          File(controllerLocation.listImagePath[index]),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: FilledButton.icon(
                    onPressed: () {
                      controllerLocation.addDisposeItem();
                      controllerLocation.imageFileList = null;
                    },
                    icon: controllerLocation.isloading.value
                        ? const CircularProgressIndicator()
                        : const Icon(Icons.upload),
                    label: const Text('Submit')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
