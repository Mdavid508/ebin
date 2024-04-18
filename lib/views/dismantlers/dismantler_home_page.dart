import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/dismantlers_controller.dart';
import 'package:ebin/controllers/mapping_controller.dart';
import 'package:ebin/views/dismantlers/dismantler_collect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DismantlersHomePage extends StatelessWidget {
  DismantlersHomePage({super.key});

  final controller = Get.put(DismantlersController());
  final controllernew = Get.put(MappingController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome Back ${controller.companyName}',
          softWrap: true,
        ),
        automaticallyImplyLeading: true,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // controllernew.getCollectors();
          Get.to(() => DismantlersCollect());
        },
        label: Text(
          'Collect',
          style: textTheme.labelLarge,
          selectionColor: MyAppColors.primaryColor,
        ),
        icon: const Icon(
          Icons.add,
          color: MyAppColors.primaryColor,
        ),
        backgroundColor: MyAppColors.surfaceLightColor,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                const DismantlersDetailsContainer(
                  weightInKgs: '7 kgs',
                  containerType: 'Collected',
                ),
                DismantlersDetailsContainer(
                  weightInKgs: '${controller.disposedWeight.toString()} kgs',
                  containerType: 'Disposed',
                ),
                const DismantlersDetailsContainer(
                  weightInKgs: '25',
                  containerType: 'Collectors',
                ),
              ],
            ),
            Text(
              'Your Collections',
              style: textTheme.titleMedium,
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controllernew.collectorData.length,
                itemBuilder: ((context, index) {
                  final item = controllernew.collectorData[index];

                  return ListTile(
                    tileColor: MyAppColors.surfaceLightColor,
                    title: Text(item.collectorName),
                    subtitle: Text('${item.totalWeight}kgs'),
                  );
                }),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

//containers that will hold the various values.
class DismantlersDetailsContainer extends StatelessWidget {
  const DismantlersDetailsContainer(
      {super.key, required this.weightInKgs, required this.containerType});

  final String weightInKgs;
  final String containerType;

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: MyAppColors.surfaceLightColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            weightInKgs,
            style: textTheme.headlineSmall,
          ),
          Text(
            containerType,
            style: textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
