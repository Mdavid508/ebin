import 'package:ebin/models/collection_point.dart';
import 'package:ebin/views/widgets/collectionpoint_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class CollectionPointController extends GetxController {
  var currenLocation = Rxn<LatLng>();
  var allMarkers = RxSet<Marker>();
  final selectedMarker = Rxn<CollectionPoint>();
  // List<Marker> allMarkers = [].obs;
  // Set<Marker> markers = {};
  late BitmapDescriptor myIcon;

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

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint('Location:');
    currenLocation.value = await getCurrentLocation();
    createMarkers();
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
              context: Get.context!,
              builder: (context) => CollectionPointBottomSheet(),
            );
          },
        ),
      );
      debugPrint('element');
    }
  }

  //method to ask user to allow the app use their device location
  Future<LatLng> getCurrentLocation() async {
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
}
