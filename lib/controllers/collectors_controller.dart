import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/models/collector_post_sale.dart';
import 'package:ebin/models/dismantler.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/widgets/collectors/collectors_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:intl/intl.dart';

class CollectorsController extends GetxController {
  //where the values will appear here this includes all the values that are going to the db.
  //map markers will also appear at this point and we will have to fetch them from the db anytime an new user joins.

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  var allMarkers = RxSet<Marker>();
  final selectedMarker = Rxn<Dismantler>();
  final lat = Rxn<LatLng>();
  final lng = Rxn<LatLng>();
  final locationData = <Dismantler>[].obs;
  final isLoading = false.obs;
  final userId = ''.obs;
  final userName = ''.obs;
  final dateOfVisit = Rx<DateTime>(DateTime.now());

  //Textediting controllers
  TextEditingController controllerDismantlersName = TextEditingController();
  TextEditingController controllerPricePerKg = TextEditingController();
  TextEditingController controllerCollectorsName = TextEditingController();
  TextEditingController controllerDateOfVisit = TextEditingController();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await fetchAllLocationData();
    createMarkers();

    ever(selectedMarker, (_) {
      debugPrint(
          "Selected Item changed to ${selectedMarker.value!.companyName}");
      controllerDismantlersName.text = selectedMarker.value!.companyName;
      controllerPricePerKg.text = selectedMarker.value!.pricePerKg.toString();
    });

    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    userId.value = savedUser!.userId;
    userName.value = savedUser.name;
    controllerCollectorsName.text = userName.value;
    controllerDateOfVisit.text =
        DateFormat('dd/MM/yyyy').format(dateOfVisit.value);
  }

  //method to fetch all documents in a collection to obtain the locationdata values for the collectors.
  Future<void> fetchAllLocationData() async {
    isLoading.value = true;
    try {
      final snapshot = await _firestore.collection('dismantler').get();
      final itemsData = Dismantler.fromQuerySnapshot(snapshot);
      locationData.assignAll(itemsData);
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  //method to load all the markers in the map
  createMarkers() {
    for (var element in locationData) {
      allMarkers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId(element.companyName),
          position: LatLng(element.lat, element.lng),
          // infoWindow: InfoWindow(
          //   title: element.collectionPointName,
          //   snippet: element.lang.toString(),
          // ),
          onTap: () {
            selectedMarker.value = element;
            showMaterialModalBottomSheet(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                )),
                context: Get.context!,
                builder: (context) => CollectorLocationBottomSheet());
          },
        ),
      );
      debugPrint('elementmap');
    }
  }

  //method to map all the data in the firebase collector postsale collection
  Future<void> postSales() async {
    final collectorId = userId.value;
    final dismantlerId = selectedMarker.value!.userId;
    final lat = selectedMarker.value!.lat;
    final lng = selectedMarker.value!.lng;
    final collectorsName = userName.value;
    final dismantlingPointName = selectedMarker.value!.companyName;

    CollectorSale collectorSale = CollectorSale(
      collectorId: collectorId,
      dismantlerId: dismantlerId,
      lat: lat,
      lng: lng,
      collectorsName: collectorsName,
      dismantlingPointName: dismantlingPointName,
      dateOfVisit: dateOfVisit.value,
    );
    try {
      isLoading.value = true;
      await _firestore.collection("postsale").doc().set(collectorSale.toMap());
      Get.snackbar('Success Message', 'Sale Posted Successfully',
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
