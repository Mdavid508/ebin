import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/views/onboarding1.dart';
import 'package:ebin/views/widgets/usecasecontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyUsecase extends StatelessWidget {
  MyUsecase({super.key});
  final AuthController authController = Get.find();

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
                  //saving to the firebase.
                  onTap: () async {
                    authController.userType.value = 'Individual';
                    authController.addUser();
                  },
                  child: const MyUsecaseContainer(
                      image: 'Assets/images/individual.jpg',
                      text: "Individual"),
                ),
                GestureDetector(
                  onTap: () {
                    authController.userType.value = 'Collector';
                    authController.addUser();
                  },
                  child: const MyUsecaseContainer(
                      image: 'Assets/images/collector.jpg', text: "Collector"),
                ),
                GestureDetector(
                  onTap: () {
                    authController.userType.value = 'Dismantler';
                    authController.addUser();
                  },
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
