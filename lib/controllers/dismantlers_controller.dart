import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/image_controller.dart';
import 'package:ebin/enums/user_type.dart';
import 'package:ebin/models/dismantler.dart';
import 'package:ebin/models/mappings_model.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/dismantlers/dismantler_navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DismantlersController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  AuthController authController = Get.put(AuthController());
  final imageController = Get.put(ImageController());
  final collectionPointController = Get.put(CollectionPointController());
  //Text Editing Controllers< DismantlersRegistration >
  TextEditingController controllerDismantlersName = TextEditingController();
  TextEditingController controllerPricePerKg = TextEditingController();
  TextEditingController controllerLocation = TextEditingController();

  //Text Editing Controllers<Repetition>
  TextEditingController controllerGetPricePerKg = TextEditingController();
  TextEditingController controllerGetDismantlersName = TextEditingController();
  TextEditingController controllerCollectionPointName = TextEditingController();

  //TextEditing Controllers<Dispose Waste Page & Collectpage>
  TextEditingController controllerWeight = TextEditingController();
  TextEditingController controllerAmount = TextEditingController();
  //this is used in the disposewaste page
  final disposedWeight = 0.0.obs;

  final collectedWeight = 0.0.obs;
  final companyName = ''.obs;
  final pricePerKg = 0.0.obs;
  final dismantlerLocation = Rxn<LatLng>();
  final userId = ''.obs;
  final isLoading = false.obs;

  final userType = UserType.dismantler.obs;
  // var dismantlerData = <Dismantler>[].obs;
  final Rx<Dismantler?> dismantlerData = Rx<Dismantler?>(null);
  //this is used in the selectdropdown button
  var itemData = <MappingModel>[].obs;
  // final collectorsName = ['Collectors Name'].obs;
  final totalAmount = 0.0.obs;

  final selected = 'Collectors Names'.obs;
  //method to set the value selected.
  void setSelected(String value) {
    selected.value = value;
  }

  @override
  void onInit() async {
    super.onInit();
    //method to get the user id from the saved userpreferences.
    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    userId.value = savedUser!.userId;
    userType.value = savedUser.userType;
    getDismantlerDetails();
    // await getCollectors();
    controllerWeight.addListener(_calculateAmount);
  }

  //void to calculate the amount
  void _calculateAmount() {
    // Parse the weight and price per kg from the text fields

    double price = double.parse(controllerGetPricePerKg.text);
    double weight = double.tryParse(controllerWeight.text) ?? 0.0;

    // Calculate the amount
    double amount = weight * price;

    // Update the amount text field
    controllerAmount.text = amount.toString();

    //store in the obs value
    totalAmount.value = amount;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    // Remove the listener when the controller is disposed
    controllerWeight.removeListener(_calculateAmount);

    super.onClose();
  }

  //method to save Dismantler Registration Details to db.
  Future<void> addDismantlerDetails() async {
    Dismantler dismantler = Dismantler(
      userId: userId.value,
      lat: dismantlerLocation.value?.latitude ?? 0.0,
      lng: dismantlerLocation.value?.longitude ?? 0.0,
      companyName: controllerDismantlersName.text,
      pricePerKg: double.parse(controllerPricePerKg.text),
      imageUrls: imageController.uploadedImageUrls,
      disposedWeight: disposedWeight.value,
      collectedWeight: collectedWeight.value,
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

  //method to fetch dismantlerDetails from the firebase Db.
  Future<void> getDismantlerDetails() async {
    isLoading.value = true;
    try {
      final snapshot = await _firestore
          .collection('dismantler')
          .where('userId', isEqualTo: userId.value)
          .get();

      final dismantlersData = Dismantler.fromQuerySnapshot(snapshot);

      dismantlerData.value = dismantlersData as Dismantler?;
      //have a function to
      controllerGetDismantlersName.text = dismantlerData.value!.companyName;
      controllerGetPricePerKg.text =
          dismantlerData.value!.pricePerKg.toString();
      controllerCollectionPointName.text =
          collectionPointController.selectedMarker.value!.collectionPointName;
      //get the company name and the values of the disposed and collected weight.
      companyName.value = dismantlerData.value!.companyName;
      disposedWeight.value = dismantlerData.value!.disposedWeight ?? 0.0;
      collectedWeight.value = dismantlerData.value!.collectedWeight ?? 0.0;
    } catch (e) {
      debugPrint("Dispose$e");
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  //method to update the value of the disposed weight during the disposal process where the dismantlers Id match.
  Future<void> updateDisposedWeight() async {
    isLoading.value = true;
    try {
      final double newWeight =
          disposedWeight.value + double.parse(controllerWeight.text);
      disposedWeight.value = newWeight;

      // Fetch the document ID of the document where the dismantler's ID matches
      final snapshot = await _firestore
          .collection('dismantler')
          .where('userId', isEqualTo: userId.value)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Update the disposed weight in the first matching document
        await _firestore
            .collection('dismantler')
            .doc(snapshot.docs.first.id)
            .update({
          'disposedWeight': newWeight,
        });

        Get.snackbar('Success', 'Disposed weight updated successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'No matching document found',
            snackPosition: SnackPosition.BOTTOM);
        getDismantlerDetails();
      }
    } catch (e) {
      debugPrint('$e');
      Get.snackbar('Error now', '$e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
