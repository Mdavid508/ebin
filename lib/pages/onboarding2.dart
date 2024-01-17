import 'package:ebin/pages/onboarding1.dart';
import 'package:ebin/pages/onboarding3.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Padding(padding: EdgeInsets.fromLTRB(16, 24, 16, 24),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [OnboardingImage(image: 'Assets/images/onboard2.jpg'),
          SizedBox(height: 24,),
          MyHeadingSection(heading: 'View Collection Points'),
          SizedBox(height: 16),
          MyTextSection(description: 'Individuals and informal dismantlers can be able to view collection points near them'),
          ],
          ),
          MyNextButton(),
          
          
          
          ],
        )
      
        )

    );
  }
}


class MyNextButton extends StatelessWidget {
  const MyNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Onboarding3()));
      },
      child: const Text('Next'),
    );
  }
}