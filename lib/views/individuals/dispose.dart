import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class IndividualDisposePage extends StatelessWidget {
  IndividualDisposePage({super.key});

  CollectionPointController controller = Get.put(CollectionPointController());

  // LatLng currentLocation = const LatLng(-0.421150, 36.949409);
  // LatLng currentLocation = controller.getCurrentLocation();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          zoomControlsEnabled: true,
          initialCameraPosition: CameraPosition(
            target: controller.currenLocation.value ??
                const LatLng(-0.421150, 36.949409),
            zoom: 14,
          ),
          markers: controller.allMarkers,
        ),
      ),
    );
  }
}
