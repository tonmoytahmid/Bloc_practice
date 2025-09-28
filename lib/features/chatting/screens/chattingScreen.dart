import 'package:bloc_practice/core/helper/google_map_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Chattingscreen extends StatefulWidget {
  const Chattingscreen({super.key});

  @override
  State<Chattingscreen> createState() => _ChattingscreenState();
}

class _ChattingscreenState extends State<Chattingscreen> {
  GoogleMapController? mapController;
  GoogleMapHelper googleMapHelper = GoogleMapHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: googleMapHelper.markerPosition,
          zoom: 14,
        ),
        markers: {
          Marker(
            markerId: MarkerId("My Marker"),
            position: googleMapHelper.markerPosition,
            infoWindow: InfoWindow(
              snippet: googleMapHelper.address,
              title: "Location",
            ),
          ),
        },
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
          googleMapHelper.getAddressFromLatLng().then((value) {
            setState(() {});
          });
        },
      ),
    );
  }
}
