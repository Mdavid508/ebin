// ignore_for_file: must_be_immutable

import 'package:ebin/controllers/collectionpoint_controller.dart';
import 'package:ebin/controllers/collectors_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CollectorDispose extends StatelessWidget {
  CollectorDispose({super.key});

  CollectionPointController controller = Get.put(CollectionPointController());
  final controller1 = Get.put(CollectorsController());

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
          markers: controller1.allMarkers,
        ),
      ),
    );
  }
}
