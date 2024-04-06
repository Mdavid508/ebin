import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/constants/colors.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/image_controller.dart';
import 'package:ebin/models/dismantler.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/dismantlers/dismantler_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class DismantlersRegistrationController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthController authController = Get.put(AuthController());
  final imageController = Get.find<ImageController>();
  TextEditingController controllerDismantlersName = TextEditingController();
  TextEditingController controllerPricePerKg = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();

  final companyName = ''.obs;
  final pricePerKg = 0.0.obs;
  final dismantlerLocation = Rxn<LatLng>();
  final userId = ''.obs;
  final isLoading = false.obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    //method to get the user id from the saved userpreferences.
    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    userId.value = savedUser!.userId;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  //method to save to db.
  Future<void> addDismantlerDetails() async {
    Dismantler dismantler = Dismantler(
      userId: userId.value,
      lat: dismantlerLocation.value?.latitude ?? 0.0,
      lng: dismantlerLocation.value?.longitude ?? 0.0,
      companyName: controllerDismantlersName.text,
      pricePerKg: double.parse(controllerPricePerKg.text),
      imageUrls: imageController.uploadedImageUrls,
    );
    isLoading.value = true;
    try {
      await _firestore
          .collection("dismantler")
          .doc(userId.value)
          .set(dismantler.toMap());
      Get.snackbar('Success Message', 'Account Registered Successfuly',
          snackPosition: SnackPosition.BOTTOM);
      // clear image list at this point
      imageController.imageFileList?.clear();
      // goes to the next page after uploading
      Get.to(const DismantlerNavigationMenu());
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
