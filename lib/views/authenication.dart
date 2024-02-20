import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/custom_icons.dart';
import 'package:ebin/views/onboarding1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Authenication extends StatelessWidget {
  const Authenication({super.key});

//initialize a getx controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyHeadingSection(
                  heading: 'Create an Account',
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            const OnboardingImage(image: 'Assets/images/onboard4.jpg'),
            const SizedBox(
              height: 80,
            ),
            MyNextButton(),
          ],
        ),
      ),
    );
  }
}

class MyNextButton extends StatelessWidget {
  MyNextButton({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => FilledButton.icon(
        icon: authController.isLoading.value
            ? const CircularProgressIndicator()
            : const Icon(
                CustomIcons.logos_google_icon,
                color: MyAppColors.errorColor,
              ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          foregroundColor:
              MaterialStateProperty.all(MyAppColors.surfaceDarkColor),
          padding: MaterialStateProperty.all(
              const EdgeInsets.fromLTRB(16, 16, 16, 16)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          elevation: MaterialStateProperty.all(3),
        ),
        onPressed: () async {
          authController.signInWithGoogle();
        },
        label: const Text('Continue with Google'),
      ),
    );
  }
}
