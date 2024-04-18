import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/controllers/collectors_controller.dart';
import 'package:ebin/controllers/dismantlers_controller.dart';
import 'package:ebin/models/mappings_model.dart';
import 'package:ebin/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MappingController extends GetxController {
  //mapping collectors and dismantlers

  final controllerCollection = Get.put(CollectorsController());
  final controllerDismantler = Get.put(DismantlersController());
  final isLoading = false.obs;
  final totalWeightCollected = 0.0.obs;
  final collectorId = ''.obs;

  final collectorName = ''.obs;
  var dismantlingDetails = <MappingModel>[].obs;
  var collectorData = <MappingModel>[].obs;
  var dismantlerData = <MappingModel>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() async {
    super.onInit();
    //method to get the user id from the saved userpreferences.
    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    collectorId.value = savedUser!.userId;
    collectorName.value = savedUser.name;
    // await getMappingDetails();
    await getCollectors();
    await getDismantlers();

    // await getCollectors();
  }

  //method to add mappings details to db.
  Future<void> addMappingDetails() async {
    MappingModel model = MappingModel(
      collectorId: collectorId.value,
      dismantlerId: controllerCollection.selectedMarker.value!.userId,
      collectorName: collectorName.value,
      dismantlerName: controllerCollection.selectedMarker.value!.companyName,
      totalWeight: 0.0,
      pricePerKg: controllerCollection.selectedMarker.value!.pricePerKg,
    );

    isLoading.value = true;
    var snapshot = await _firestore
        .collection('mappingmodel')
        .where('collectorId', isEqualTo: collectorId.value)
        .where('dismantlerId',
            isEqualTo: controllerCollection.selectedMarker.value!.userId)
        .get();

    if (snapshot.docs.isNotEmpty) {
      Get.snackbar(
          'Message', 'Dismantling Company has already been added to your List',
          snackPosition: SnackPosition.BOTTOM);
      isLoading.value = false;
      return;
    }
    try {
      await _firestore.collection('mappingmodel').doc().set(model.toMap());
      isLoading.value = false;
      Get.snackbar('Success Message', 'Dismantler added to your List',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      debugPrint(e.toString());
      isLoading.value = false;
    }
  }

  //method to fetch the data in a list to find out if the dismantler is saved.
  Future<void> getMappingDetails() async {
    try {
      final snapshot = await _firestore.collection('mappingmodel').get();
      final items = MappingModel.fromQuerySnapshot(snapshot);
      dismantlingDetails.assignAll(items);
      dismantlingDetails.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  //method to update the Weight Collected <This will be updated from the Dismantlers Side>
  Future<void> updateTotalCollectedWeight() async {
    isLoading.value = true;
    try {
      controllerDismantler.collectedWeight.value =
          double.parse(controllerDismantler.controllerWeight.text);
      final double newWeight = totalWeightCollected.value +
          controllerDismantler.collectedWeight.value;
      totalWeightCollected.value = newWeight;

      // Fetch the document ID of the document where the dismantler's ID matches
      final snapshot = await _firestore
          .collection('mappingmodel')
          .where('dismantlerId', isEqualTo: controllerDismantler.userId.value)
          .get();

      if (snapshot.docs.isNotEmpty) {
        // Update the disposed weight in the first matching document
        await _firestore
            .collection('mappingmodel')
            .doc(snapshot.docs.first.id)
            .update({
          'totalWeight': newWeight,
        });

        Get.snackbar('Success', 'Collected  weight updated successfully',
            snackPosition: SnackPosition.BOTTOM);
        getCollectors();
      } else {
        Get.snackbar('Error', 'No matching document found',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      debugPrint('$e');
      Get.snackbar('Error now', '$e', snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  //method to get the dismantlers from the collector side
  Future<void> getDismantlers() async {
    try {
      final snapshot = await _firestore
          .collection('mappingmodel')
          .where('collectorId', isEqualTo: collectorId.value)
          .get();

      final items = MappingModel.fromQuerySnapshot(snapshot);
      dismantlerData.assignAll(items);
      Get.snackbar(
          'title', '${dismantlerData.length} names ${collectorId.value}',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      debugPrint('$e');
      Get.snackbar('Error', '$e bbb', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> getCollectors() async {
    try {
      final snapshot = await _firestore
          .collection('mappingmodel')
          .where('dismantlerId', isEqualTo: controllerDismantler.userId.value)
          .get();

      final items = MappingModel.fromQuerySnapshot(snapshot);
      collectorData.assignAll(items);
    } catch (e) {
      debugPrint('$e');
      Get.snackbar('Error', '$e bbb', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
