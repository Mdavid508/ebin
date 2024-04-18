import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/mapping_controller.dart';
import 'package:ebin/views/dismantlers/dismantler_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectorsHomePage extends StatelessWidget {
  CollectorsHomePage({super.key});

  final controllernew = Get.put(MappingController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Back, Luca'),
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Wrap(
              alignment: WrapAlignment.center,
              spacing: 16,
              runSpacing: 8,
              children: [
                DismantlersDetailsContainer(
                  weightInKgs: '7 kgs',
                  containerType: 'Collected',
                ),
                DismantlersDetailsContainer(
                  weightInKgs: 'KES 1700',
                  containerType: 'Earned',
                ),
                DismantlersDetailsContainer(
                  weightInKgs: '5',
                  containerType: 'Dismantling Points',
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Your Dismantlers',
              style: textTheme.titleMedium,
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                shrinkWrap: true,
                itemCount: controllernew.dismantlerData.length,
                itemBuilder: ((context, index) {
                  final item = controllernew.dismantlerData[index];

                  return ListTile(
                    tileColor: MyAppColors.surfaceLightColor,
                    title: Text(item.dismantlerName),
                    subtitle: Text('${item.pricePerKg}kgs'),
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
