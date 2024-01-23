import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/constants/firebase_auth_constants.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/individuals/activity.dart';
import 'package:ebin/views/individuals/dispose.dart';
import 'package:ebin/views/individuals/homepage.dart';
import 'package:ebin/views/onboarding1.dart';
import 'package:ebin/views/usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  GoogleSignIn googleSign = GoogleSignIn();
  final isLoading = false.obs;
  final email = ''.obs;
  final name = ''.obs;
  final profileUrl = ''.obs;
  final userId = ''.obs;
  final userType = ''.obs;
  @override
  void onReady() {
    //checking for user availability?? null or not null

    super.onReady();
    //getting user using google
    googleSignInAccount = Rx<GoogleSignInAccount?>(googleSign.currentUser);

    googleSignInAccount.bindStream(googleSign.onCurrentUserChanged);

    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

//validate a user if has an account or not
  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    isLoading.value = false;

    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offAll(() => const Onboarding1());
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      email.value = googleSignInAccount.email;
      name.value = googleSignInAccount.displayName ?? "";
      profileUrl.value = googleSignInAccount.photoUrl ?? "";
      userId.value = googleSignInAccount.id;

      Get.offAll(() => MyUsecase());
      // googleSign.signOut();
    }
  }

  void signInWithGoogle() async {
    // Trigger the authentication flow
    isLoading.value = true;

    try {
      GoogleSignInAccount? googleSignInAccount = await googleSign.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        debugPrint('idtoken: ${googleSignInAuthentication.idToken}');
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Logout from account
  void signout() async {
    await auth.signOut();
    await googleSign.signOut();
  }

  //Register user to firebase
  void addUser() async {
    UserModel user = UserModel(
      userId: userId.value,
      email: email.value,
      name: name.value,
      profileUrl: profileUrl.value,
      userType: userType.value,
    );

    isLoading.value = true;
    try {
      await _firestore.collection("users").doc(userId.value).set(user.toMap());
      //shared preferences method to save login details locally
      await saveUserDetailsSharedprefs();
      // move to dashboard depending on user type
      if (userType.value == "Individual") {
        Get.to(const IndividualHomePage());
      } else if (userType.value == "Dismantler") {
        Get.to(const IndividualActivityPage());
      } else if (userType.value == 'Collector') {
        Get.to(const IndividualDisposePage());
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUserDetailsSharedprefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', userId.value);
    prefs.setString('email', email.value);
    prefs.setString('name', name.value);
    prefs.setString('profileUrl', profileUrl.value);
    prefs.setString('userType', userType.value);
  }

  Future<UserModel> getUserDetailsFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? email = prefs.getString('email');
    String? name = prefs.getString('name');
    String? profileUrl = prefs.getString('profileUrl');
    String? userType = prefs.getString('userType');

    return UserModel(
      userId: userId ?? '',
      email: email ?? '',
      name: name ?? '',
      profileUrl: profileUrl ?? '',
      userType: userType ?? '',
    );
  }
}
