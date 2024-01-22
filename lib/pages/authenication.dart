import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/signincontroller.dart';
import 'package:ebin/custom_icons.dart';
import 'package:ebin/pages/onboarding1.dart';
import 'package:ebin/pages/usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authenication extends StatelessWidget {
  const Authenication({super.key});

//initialize a getx controller

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 64, 16, 24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MyHeadingSection(
                  heading: 'Create an Account',
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            OnboardingImage(image: 'Assets/images/onboard4.jpg'),
            SizedBox(
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
  const MyNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
        icon: const Icon(
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
          try {
            final user = await UserController.signInWithGoogle();
            Get.to(const MyUsecase());
          } on FirebaseException catch (error) {
            print(error.message);
            Get.snackbar('title', error.message ?? 'something went wrong');
          } catch (e) {
            print(e);
            Get.snackbar('title', e.toString());
          }
        },
        label: const Text('Continue with Google '));
  }
}
