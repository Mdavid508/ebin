import 'package:flutter/material.dart';

class IndividualProfilePage extends StatefulWidget {
  const IndividualProfilePage({super.key});

  @override
  State<IndividualProfilePage> createState() => _IndividualProfilePageState();
}

class _IndividualProfilePageState extends State<IndividualProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Text("Profile Page"),
      ),
    );
  }
}