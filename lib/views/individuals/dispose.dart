import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLocation = LatLng(-1.2833300, 36.8166700);

class IndividualDisposePage extends StatefulWidget {
  const IndividualDisposePage({super.key});

  @override
  State<IndividualDisposePage> createState() => _IndividualDisposePageState();
}

class _IndividualDisposePageState extends State<IndividualDisposePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SafeArea(
      child: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: currentLocation, zoom: 14),
      ),
    ));
  }
}
