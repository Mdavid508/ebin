import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyCategoryItemBuilder extends StatelessWidget {
  const MyCategoryItemBuilder(
      {super.key, required this.image, required this.itemName});

  final String image;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      height: 100,
      width: double.infinity,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          color: MyAppColors.surfaceLightColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              image,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  itemName,
                  softWrap: true,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
