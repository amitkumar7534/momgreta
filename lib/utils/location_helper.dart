import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geocoding/geocoding.dart';

class LocationHelper {
  /// Request location permission
  static Future<bool> requestPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied) {
      status = await Permission.location.request();
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();
      return false;
    }

    return status.isGranted;
  }

  /// Get current position
  static Future<Position?> getCurrentLocation() async {
    bool hasPermission = await requestPermission();
    if (!hasPermission) return null;

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  /// Get full address from coordinates
  static Future<String?> getAddressFromLatLng(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        return "${place.name}, ${place.locality}, ${place.administrativeArea}, "
            "${place.postalCode}, ${place.country}";
      }
    } catch (e) {
      print("❌ Error in getAddressFromLatLng: $e");
    }
    return null;
  }

  /// Get city and state only
  static Future<Map<String, String>?> getCityAndState(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;

        return {
          "city": place.locality ?? "",
          "state": place.administrativeArea ?? "",
        };
      }
    } catch (e) {
      print("❌ Error in getCityAndState: $e");
    }
    return null;
  }

  /// Check location service status
  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }
}
