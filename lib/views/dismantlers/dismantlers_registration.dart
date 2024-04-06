import 'dart:io';

import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/dismantlers_registration.dart';
import 'package:ebin/controllers/image_controller.dart';
import 'package:ebin/views/dismantlers/dismantler_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DismantlersRegistration extends StatelessWidget {
  DismantlersRegistration({super.key});
  final imageController = Get.put(ImageController());
  final controller = Get.put(DismantlersRegistrationController());
  final controllerLocation = Get.put(CollectionPointController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Register as a Dismantler",
                      style: textTheme.titleLarge,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.controllerDismantlersName,
                  decoration: const InputDecoration(
                    labelText: 'Name of Dismantler',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.controllerPricePerKg,
                  decoration: const InputDecoration(
                    labelText: 'Price per Kg',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(
                  () => TextFormField(
                    onTap: () async {
                      controller.dismantlerLocation.value =
                          await controllerLocation.getCurrentLocation();
                    },
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText:
                          '${controller.dismantlerLocation.value?.latitude.toString()} , ${controller.dismantlerLocation.value?.longitude.toString()}',
                      icon: const Icon(Icons.add),
                      helperText:
                          'Make sure you are in the Store Location, Current Location will be picked',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: controller.controllerLocation,
                  onTap: () {
                    imageController.selectImages();
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.upload),
                    helperText: 'Upload a Maximum of 3 images',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  children: [
                    Obx(() => GridView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 8,
                                  crossAxisSpacing: 8),
                          itemCount: imageController.selectedFileCount.value,
                          itemBuilder: (context, index) {
                            return Image.file(
                              File(imageController.listImagePath[index]),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            );
                          },
                        ))
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Center(
                  child: Obx(
                    () => FilledButton.icon(
                      onPressed: () async {
                        await imageController.uploadImages();
                        await controller.addDismantlerDetails();
                        imageController.imageFileList?.clear();
                      },
                      icon: imageController.isloading.value ||
                              controllerLocation.isloading.value
                          ? const CircularProgressIndicator()
                          : const Icon(Icons.upload),
                      label: const Text('Submit'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
