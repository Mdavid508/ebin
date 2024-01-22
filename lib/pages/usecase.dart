import 'package:ebin/pages/individuals/navigation_menu.dart';
import 'package:ebin/pages/onboarding1.dart';
import 'package:ebin/pages/widgets/usecasecontainer.dart';
import 'package:flutter/material.dart';

class MyUsecase extends StatelessWidget {
  const MyUsecase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      image: 'Assets/images/collector.jpg', text: "Collector"),
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
        ),
      ),
    );
  }
}
