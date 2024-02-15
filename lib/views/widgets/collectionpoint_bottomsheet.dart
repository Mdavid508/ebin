// ignore_for_file: must_be_immutable

import 'package:ebin/Assets/Theme/custom_theme/text_theme.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CollectionPointBottomSheet extends StatelessWidget {
  CollectionPointBottomSheet({super.key});

  CollectionPointController controller = Get.put(CollectionPointController());

  @override
  Widget build(BuildContext context) {
    final textTheme = MyAppTextTheme.lightTheme;
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
                      'Giakanja Collection Point',
                      style: textTheme.titleMedium,
                    ),
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        '5km from your Location',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        '25 mins from your Location',
                        style: textTheme.bodyMedium,
                      ),
                    ],
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
                            "https://imgs.search.brave.com/g821mH-bvSydL_diaLs05wsBusD8XOdbitkAQErG9Hk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nbWNs/ZWFuaW5nLmNvLmtl/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L0VsZWN0cm9u/aWMtV2FzdGUtTWFu/YWdlbWVudC1hbmQt/RGlzcG9zYWwtaW4t/S2VueWEuanBn"),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Image.network(
                            "https://imgs.search.brave.com/g821mH-bvSydL_diaLs05wsBusD8XOdbitkAQErG9Hk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nbWNs/ZWFuaW5nLmNvLmtl/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L0VsZWN0cm9u/aWMtV2FzdGUtTWFu/YWdlbWVudC1hbmQt/RGlzcG9zYWwtaW4t/S2VueWEuanBn"),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Flexible(
                        flex: 1,
                        child: Image.network(
                            "https://imgs.search.brave.com/g821mH-bvSydL_diaLs05wsBusD8XOdbitkAQErG9Hk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nbWNs/ZWFuaW5nLmNvLmtl/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L0VsZWN0cm9u/aWMtV2FzdGUtTWFu/YWdlbWVudC1hbmQt/RGlzcG9zYWwtaW4t/S2VueWEuanBn"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FilledButton(onPressed: () {}, child: const Text('Dispose')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
