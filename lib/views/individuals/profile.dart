import 'package:ebin/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IndividualProfilePage extends StatelessWidget {
  IndividualProfilePage({super.key});
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile'),
      ),
      body: Center(
        child: FilledButton(
          onPressed: () {
            controller.signout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
