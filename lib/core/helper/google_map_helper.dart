import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapHelper {
  final LatLng markerPosition = LatLng(23.83247473149818, 90.3731666505608);
  String? address;

  Future<void> getAddressFromLatLng() async {
    try {
      List<Placemark> placemaeks = await placemarkFromCoordinates(
        markerPosition.latitude,
        markerPosition.longitude,
      );
      Placemark place = placemaeks[0];
      address =
          "${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      address = "Error in fetching address";
    }
  }
}
