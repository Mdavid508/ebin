import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebin/controllers/auth_controller.dart';
import 'package:ebin/controllers/image_controller.dart';
import 'package:ebin/controllers/item_eol_controller.dart';
import 'package:ebin/enums/user_type.dart';
import 'package:ebin/models/collection_point.dart';
import 'package:ebin/models/dispose_item.dart';
import 'package:ebin/models/user.dart';
import 'package:ebin/views/widgets/individuals/collectionpoint_bottomsheet.dart';
import 'package:ebin/views/widgets/dismantlers/disposalpoint_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CollectionPointController extends GetxController {
  final List<CollectionPoint> locations = [
    CollectionPoint(
      collectionPointName: "Giakanja Collection Point",
      lat: -0.467629,
      lang: 36.941558,
      imageUrls: [
        "https://imgs.search.brave.com/g821mH-bvSydL_diaLs05wsBusD8XOdbitkAQErG9Hk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nbWNs/ZWFuaW5nLmNvLmtl/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L0VsZWN0cm9u/aWMtV2FzdGUtTWFu/YWdlbWVudC1hbmQt/RGlzcG9zYWwtaW4t/S2VueWEuanBn",
        "https://imgs.search.brave.com/miqVDo5E06KbpfyJHR_aVX3INaql65z65kYHnqncaBI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZWxlY3Ryb25pY3dh/c3RlcnMuY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDIyLzA0/L0tlbnlhLTEtQmV6/LUNhYmFsbGVyby0z/MjB4MjEzLmpwZw",
        "https://imgs.search.brave.com/s_ghSTvQVMYw7jvmgrEJ4b0bfT2TzIjcvdWMtaPNl-Y/rs:fit:500:0:0/g:ce/aHR0cHM6Ly92aWN0/b3JtYXRhcmEuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzA5L0xpc3QtT2Yt/VG9wLVdhc3RlLU1h/bmFnZW1lbnQtQ29t/cGFuaWVzLUluLUtl/bnlhLmpwZw",
      ],
    ),
    CollectionPoint(
      collectionPointName: 'Boden Powell Collection Point',
      lat: -0.4576289,
      lang: 36.9415585,
      imageUrls: [
        "https://imgs.search.brave.com/g821mH-bvSydL_diaLs05wsBusD8XOdbitkAQErG9Hk/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9nbWNs/ZWFuaW5nLmNvLmtl/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDIy/LzA0L0VsZWN0cm9u/aWMtV2FzdGUtTWFu/YWdlbWVudC1hbmQt/RGlzcG9zYWwtaW4t/S2VueWEuanBn",
        "https://imgs.search.brave.com/miqVDo5E06KbpfyJHR_aVX3INaql65z65kYHnqncaBI/rs:fit:500:0:0/g:ce/aHR0cHM6Ly93d3cu/ZWxlY3Ryb25pY3dh/c3RlcnMuY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDIyLzA0/L0tlbnlhLTEtQmV6/LUNhYmFsbGVyby0z/MjB4MjEzLmpwZw",
        "https://imgs.search.brave.com/s_ghSTvQVMYw7jvmgrEJ4b0bfT2TzIjcvdWMtaPNl-Y/rs:fit:500:0:0/g:ce/aHR0cHM6Ly92aWN0/b3JtYXRhcmEuY29t/L3dwLWNvbnRlbnQv/dXBsb2Fkcy8yMDE5/LzA5L0xpc3QtT2Yt/VG9wLVdhc3RlLU1h/bmFnZW1lbnQtQ29t/cGFuaWVzLUluLUtl/bnlhLmpwZw",
      ],
    )
  ].obs;
  //Controllers
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final controllerItem = Get.put(ItemsController());
  AuthController authController = Get.put(AuthController());
  final imageController = Get.put(ImageController());

  var currenLocation = Rxn<LatLng>();
  var allMarkers = RxSet<Marker>();
  final selectedMarker = Rxn<CollectionPoint>();
  final lat = Rxn<LatLng>();
  final lng = Rxn<LatLng>();
  late BitmapDescriptor myIcon;
  TextEditingController controllerCollectionPointName = TextEditingController();
  final ImagePicker imagepicker = ImagePicker();
  List<XFile>? imageFileList = []; //stores the images.
  RxList<String> listImagePath = <String>[].obs;
  var selectedFileCount = 0.obs;
  var isloading = false.obs;
  final userId = ''.obs;
  final userType = UserType.individual.obs;
  var selectedCategory = ''.obs;
  final itemName = ''.obs;
  final brandName = ''.obs;
  final selectedLat = ''.obs;
  final selectedLng = ''.obs;
  var collectionPointName = ''.obs;
  //variables to be saved to dismantler database

  @override
  Future<void> onInit() async {
    super.onInit();
    currenLocation.value = await getCurrentLocation();
    createMarkers();
    //Function to make sure the selected markers are reflected.
    ever(selectedMarker, (_) {
      debugPrint(
          "Selected Item changed to ${selectedMarker.value!.collectionPointName}");
      controllerCollectionPointName.text =
          selectedMarker.value!.collectionPointName;
    });

    //method to get the user id from the saved userpreferences.
    UserModel? savedUser = await AuthController.getUserDetailsFromSharedPref();
    userId.value = savedUser!.userId;
    userType.value = savedUser.userType; //enums not working well
  }

  //method to load all the markers in the map
  createMarkers() {
    for (var element in locations) {
      allMarkers.add(
        Marker(
          icon: BitmapDescriptor.defaultMarker,
          markerId: MarkerId(element.collectionPointName),
          position: LatLng(element.lat, element.lang),
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
              builder: (context) => userType.value == UserType.individual
                  ? CollectionPointBottomSheet()
                  : DisposalPointBottomSheet(),
            );
          },
        ),
      );
      debugPrint('elementmap ${userType.value}');
    }
  }

  //method to ask user to allow the app use their device location
  Future<LatLng> getCurrentLocation() async {
    isloading.value = true;
    debugPrint('Location: Start get location');
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location Services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar(
        'Location Permission Error',
        'Location Permission are denied, we cannot make the request',
      );
    }

    //getting the current location from device location
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    debugPrint('Location: Finish get location');
    isloading.value = false;
    return LatLng(position.latitude, position.longitude);
  }

  //method to calculate the distance betweein the current location and Selected Marker
  calculateDistance() async {
    double distanceInMeters = Geolocator.distanceBetween(
      currenLocation.value!.latitude,
      currenLocation.value!.longitude,
      selectedMarker.value!.lat,
      selectedMarker.value!.lang,
    );
    return distanceInMeters;
  }

  //validating the required details this includes the images and the brandname.
  bool _isValid() {
    if (controllerItem.controllerBrand.text.trim().isEmpty) {
      Get.snackbar('Required', 'The brand name is required',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }

    if (selectedFileCount.value == 0) {
      Get.snackbar(
          'Images Required', 'Please Upload a minimum of 2 and Maximum of 3',
          snackPosition: SnackPosition.BOTTOM);
      return false;
    }
    return true;
  }

  //here we are creating the method to save data to firebase
  Future<void> addDisposeItem() async {
    selectedCategory.value = controllerItem.selectedItem.value!.category;
    itemName.value = controllerItem.selectedItem.value!.itemName;
    brandName.value = controllerItem.controllerBrand.text;
    selectedLat.value = selectedMarker.value!.lat.toString();
    selectedLng.value = selectedMarker.value!.lang.toString();
    collectionPointName.value = selectedMarker.value!.collectionPointName;

    ItemDispose itemDispose = ItemDispose(
      userId: userId.value,
      itemName: itemName.value,
      category: selectedCategory.value,
      brandName: brandName.value,
      collectionPointLat: double.parse(selectedLat.value),
      collectionPointLng: double.parse(selectedLng.value),
      collectionPointName: collectionPointName.value,
      imageUrls: imageController.uploadedImageUrls,
    );

    //method to check validation rules are followed.
    if (_isValid()) {
      isloading.value = true;
      try {
        await _firestore
            .collection("itemdispose")
            .doc()
            .set(itemDispose.toMap());
        Get.snackbar('Success Message', 'Items added Successfuly',
            snackPosition: SnackPosition.BOTTOM);
        controllerItem.controllerBrand.clear();
      } catch (e) {
        Get.snackbar(
          'Error',
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );
        debugPrint(e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }
}
