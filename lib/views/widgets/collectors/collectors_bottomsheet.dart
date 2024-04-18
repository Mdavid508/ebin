import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/collectors_controller.dart';
import 'package:ebin/controllers/dismantlers_controller.dart';
import 'package:ebin/controllers/mapping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CollectorLocationBottomSheet extends StatelessWidget {
  CollectorLocationBottomSheet({super.key});

  final controllerDismantler = Get.put(DismantlersController());
  final controllerCollector = Get.put(CollectorsController());
  final controllerMapping = Get.put(MappingController());
  final controllernew = Get.put(MappingController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    final markerValue = controllerCollector.selectedMarker.value;
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  Row(children: [
                    Text(
                      markerValue!.companyName,
                      style: textTheme.titleMedium,
                    ),
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Text(
                        'Overview',
                        style: textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Image.network(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          markerValue.imageUrls[0],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Image.network(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          markerValue.imageUrls[1],
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Image.network(
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          markerValue.imageUrls[2],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Obx(
                    () => FilledButton.icon(
                        onPressed: () async {
                          await controllerMapping.getMappingDetails();
                          await controllerMapping.addMappingDetails();

                          // controllernew.getDismantlers();
                          // controllernew.getCollectors();
                        },
                        icon: controllerMapping.isLoading.value
                            ? const CircularProgressIndicator()
                            : const Icon(Icons.add),
                        label: const Text('Add to your List')),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
