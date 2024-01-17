import 'package:ebin/constants/colors.dart';
import 'package:ebin/pages/individuals/navigation_menu.dart';
import 'package:ebin/pages/onboarding1.dart';
import 'package:flutter/material.dart';

class MyUsecase extends StatelessWidget {
  const MyUsecase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.fromLTRB(16, 40, 16, 24),
          child: Column(
            children: [
              const MyHeadingSection(
                heading: 'Continue as a ?',
              ),
              const SizedBox(
                height: 24,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 16.0,
                runSpacing: 16.0,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyNavigationMenu(),
                        )),
                    child: const MyUsecaseContainer(
                        image: 'Assets/images/individual.jpg',
                        text: "Individual"),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding1(),
                        )),
                    child: const MyUsecaseContainer(
                        image: 'Assets/images/collector.jpg',
                        text: "Collector"),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Onboarding1(),
                        )),
                    child: const MyUsecaseContainer(
                        image: 'Assets/images/dismantler.jpg',
                        text: "Dismantler"),
                  ),
                ],
              ),
            ],
          )),
    );
  }
}

//return container that takes an image and text.
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
