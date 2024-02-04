import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ItemDataBuilder extends StatelessWidget {
  ItemDataBuilder({
    super.key,
    required this.itemName,
    required this.brandName,
    required this.eol,
    required this.yearofPurchase,
  });

  String itemName;
  String eol;
  String brandName;
  String yearofPurchase;

  //method to calculate remaining period in years
  _remainingPeriod() {
    var currentYear = DateTime.now().year;
    var newTime = int.parse(yearofPurchase) + int.parse(eol);

    if (newTime <= currentYear) {
      return const Text('Eol reached');
    } else {
      var remYears = newTime - currentYear;
      return Text(remYears.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          color: MyAppColors.surfaceLightColor,
          border: Border.all(
            color: MyAppColors.outline,
            width: 1,
          )),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(itemName),
                Text(brandName),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('End Of Life'),
                Text('$eol Years'),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Year of Purchase'),
                Text(yearofPurchase.toString()),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Years Left'),
                _remainingPeriod(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
