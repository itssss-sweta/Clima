import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Future<void> getCurrentLocation() async {
    try {
      // Request location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        // Permission granted, fetch the device's location
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.low);
        latitude = position.latitude;
        longitude = position.longitude;
        // Handle the obtained position as needed
      } else {
        // Location permission denied
        // Display an error message or provide alternative functionality
        print('Location permission denied');
      }
    } catch (e) {
      // Handle any other exceptions that may occur
      print('Error: $e');
    }
  }
}
