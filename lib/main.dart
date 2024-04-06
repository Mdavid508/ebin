import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/firebase_options.dart';
import 'package:ebin/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ebin/Assets/Theme/theme.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //get the loggedin user.
  final UserModel? loggedInUser =
      await AuthController.getUserDetailsFromSharedPref();
  runApp(MyApp(
    loggedInUser: loggedInUser,
  ));
}

class MyApp extends StatelessWidget {
  final UserModel? loggedInUser;

  const MyApp({super.key, required this.loggedInUser});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyAppTheme.theme,
      home: AuthController.getHomepage(loggedInUser),
    );
  }
}
