import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/enums/user_type.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/authenication.dart';
import 'package:ebin/views/collectors/collector_navigation_menu.dart';
import 'package:ebin/views/collectors/collectors_home_page.dart';
import 'package:ebin/views/dismantlers/dismantler_navigation_menu.dart';
import 'package:ebin/views/dismantlers/dismantlers_registration.dart';
import 'package:ebin/views/individuals/navigation_menu.dart';
import 'package:ebin/views/onboarding1.dart';
import 'package:ebin/views/usecase.dart';
import 'package:flutter/material.dart';
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
  final userType = UserType.individual.obs;
  final dismantlerRegistered = false.obs;
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
  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) async {
    isLoading.value = false;

    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.snackbar('Sign In', 'Sign In not Successful please try again');
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      email.value = googleSignInAccount.email;
      name.value = googleSignInAccount.displayName ?? "";
      profileUrl.value = googleSignInAccount.photoUrl ?? "";
      userId.value = googleSignInAccount.id;
      // check if user is registered in the database
      UserModel? registerdUser = await checkUser(googleSignInAccount.id);

      if (registerdUser == null) {
        Get.offAll(() => MyUsecase());
      } else {
        // save user to shared prefs
        userType.value = registerdUser.userType;
        await saveUserDetailsSharedprefs();
        // user had already been registerd in the system. Redirect based on userType
        Get.offAll(AuthController.getHomepage(registerdUser));
      }
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
    // auth.signOut();

    await googleSign.signOut();
    await clearUserData();
    Get.offAll(const Authenication());
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
      if (userType.value == UserType.individual) {
        Get.to(
          const IndividualNavigationMenu(),
        );
      } else if (userType.value == UserType.dismantler) {
        Get.to(
          DismantlersRegistration(),
        );
      } else if (userType.value == UserType.collector) {
        Get.to(
          CollectorsHomePage(),
        );
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
    prefs.setString('userType', getUserTypeStr(userType.value));
  }

  static Future<UserModel?> getUserDetailsFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('userId');
    String? email = prefs.getString('email');
    String? name = prefs.getString('name');
    String? profileUrl = prefs.getString('profileUrl');
    String? userType = prefs.getString('userType');

    if (userId == null) return null;

    return UserModel(
      userId: userId,
      email: email ?? '',
      name: name ?? '',
      profileUrl: profileUrl ?? '',
      userType: getUserType(userType),
    );
  }

  static UserType getUserType(String? userType) {
    if (userType == "Individual") {
      return UserType.individual;
    }
    if (userType == 'Dismantler') {
      return UserType.dismantler;
    }
    if (userType == 'Collector') {
      return UserType.collector;
    }
    return UserType.individual;
  }

  static String getUserTypeStr(UserType userType) {
    if (userType == UserType.individual) {
      return "Individual";
    }
    if (userType == UserType.dismantler) {
      return 'Dismantler';
    }
    if (userType == UserType.collector) {
      return 'Collector';
    }
    return "Individual";
  }

  // clear user data from shared prefs
  Future<void> clearUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  Future<UserModel?> checkUser(String userId) async {
    DocumentSnapshot snapshot =
        await _firestore.collection("users").doc(userId).get();
    if (!snapshot.exists) return null;

    return UserModel.fromDocument(snapshot);
  }

  //get homepage.
  static Widget getHomepage(UserModel? loggedInUser) {
    if (loggedInUser?.userType == UserType.individual) {
      return const IndividualNavigationMenu();
    } else if (loggedInUser?.userType == UserType.dismantler) {
      return const DismantlerNavigationMenu();
    } else if (loggedInUser?.userType == UserType.collector) {
      return const CollectorNavigationMenu();
    }
    return const Onboarding1();
  }
}
