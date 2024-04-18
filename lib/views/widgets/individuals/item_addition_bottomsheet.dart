import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/item_eol_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemAdditionBottomSheet extends StatelessWidget {
  ItemAdditionBottomSheet({super.key});

  // get controller without desctroying its state
  final ItemsController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var textTheme = MyAppTextTheme.lightTheme;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 16),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  margin: const EdgeInsets.only(bottom: 0),
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add Electronic Item",
                          style: textTheme.titleMedium,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      child: Column(
                    children: [
                      TextFormField(
                        controller: controller.controllerItemName,
                        readOnly: true,
                        cursorColor: MyAppColors.outline,
                        decoration: const InputDecoration(
                            labelText: 'Electronic Item Name'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controller.controllerEol,
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: 'End of Life',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controller.controllerDate,
                        onTap: () {
                          controller.datePicker();
                        },
                        readOnly: true,
                        decoration: const InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: 'Select Date of Purchase'),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFormField(
                        controller: controller.controllerBrand,
                        cursorColor: MyAppColors.outline,
                        decoration: const InputDecoration(
                          labelText: 'Enter Brand',
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => FilledButton.icon(
                          onPressed: () async {
                            controller.addEolItem();
                            controller.fetchAllEolItems();
                          },
                          icon: controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : const Icon(Icons.save),
                          label: const Text('Submit'),
                        ),
                      ),
                    ],
                  )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
