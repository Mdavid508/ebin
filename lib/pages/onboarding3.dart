import 'package:ebin/pages/onboarding1.dart';
import 'package:ebin/pages/authenication.dart';
import 'package:flutter/material.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                children: [
                  OnboardingImage(image: 'Assets/images/onboard3.jpg'),
                  SizedBox(height: 24),
                  MyHeadingSection(heading: 'Find E-Waste Dismantlers'),
                  SizedBox(height: 16),
                  MyTextSection(description: 'Informal Collectors can be able to Locate Electronic Waste Dismantlers Near Them'),
                ],
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
    return FilledButton(onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Authenication(),));
    }, child: const Text('Next'));
  }
}