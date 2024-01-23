import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/individuals/activity.dart';
import 'package:ebin/views/individuals/homepage.dart';
import 'package:ebin/views/onboarding2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() async {
    super.initState();
    UserModel savedUser = await authController.getUserDetailsFromSharedPref();

    if (savedUser.userId != '') {
      if (savedUser.userType == 'Individual') {
        Get.to(const IndividualHomePage());
      } else if (savedUser.userType == 'Dismantler') {
        Get.to(const IndividualActivityPage());
      } else if (savedUser.userType == 'Collector') {
        Get.to(const IndividualHomePage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
            padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Mytextbutton(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OnboardingImage(image: 'Assets/images/onboard1.jpg'),
                    SizedBox(
                      height: 24,
                    ),
                    MyHeadingSection(heading: 'Promote Circular Economy'),
                    SizedBox(height: 16),
                    MyTextSection(
                        description:
                            'E-bin Promotes Circular Economy Through Proper Collection and Disposal of Electronic Waste'),
                  ],
                ),
                Mybutton(),
              ],
            )));
  }
}

//Onboarding image widget for all the onboarding pages.
class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    ); // Image.asset
  }
}

//My heading section widget for all the onboarding pages.
class MyHeadingSection extends StatelessWidget {
  const MyHeadingSection({super.key, required this.heading});

  final String heading;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          heading,
          style: textTheme.headlineMedium,
        )
      ],
    );
  }
}

//My text section widget for all the onboarding pages.
class MyTextSection extends StatelessWidget {
  const MyTextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        description,
        style: textTheme.bodyLarge,
        softWrap: true,
      ),
    ]);
  }
}

class Mybutton extends StatelessWidget {
  const Mybutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        child: const Text('Next'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Onboarding2()));
        });
  }
}

//My text button widget for the 3 onboarding pages.
class Mytextbutton extends StatelessWidget {
  const Mytextbutton({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextButton(
        onPressed: () {},
        child: Text(
          'Skip',
          style: textTheme.labelLarge?.copyWith(
            color: MyAppColors.primaryColor,
          ),
        ));
  }
}
