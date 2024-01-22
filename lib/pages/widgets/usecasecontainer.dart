import 'package:ebin/constants/colors.dart';
import 'package:flutter/material.dart';

class MyUsecaseContainer extends StatelessWidget {
  const MyUsecaseContainer(
      {super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: MyAppColors.surfaceLightColor,
        border: Border.all(
          color: Colors.black45,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(
            height: 16,
          ),
          Text(
            text,
            style: textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
