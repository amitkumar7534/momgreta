import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:momgreta/utils/extensions/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:http/src/response.dart';

import 'dart:typed_data';

import '../components/styles/appColors.dart';
import '../core/error.dart';


class AppUtils {
  static final ImagePicker _imagePicker = ImagePicker();
  static final Logger _log = Logger();

  static dynamic _userId;

  /// Logs a debug message
  static void log(var msg) => _log.d(msg);

  /// Logs an error message
  static void logEr(var msg) => _log.e(msg);

  /// Getter for the user ID
  static dynamic get userId => _userId;

  /// Sets the user ID dynamically
  static void setUserId(dynamic id) {
    _userId = id;
    log("User ID set to: $id");
  }



  static Future<String?> imagePicker() async {
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);
    return image?.path;
  }

  static String get deviceType {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isWindows) {
      return 'windows';
    } else if (Platform.isLinux) {
      return 'linux';
    } else {
      return 'unknown';
    }
  }

  static String getTimeBasedGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return 'Good Morning';
    } else if (hour >= 12 && hour < 17) {
      return 'Good Afternoon';
    } else if (hour >= 17 && hour < 21) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }
  static Future<Uint8List?> fetchVideoBytes(String videoUrl) async {
    try {
      final response = await http.get(Uri.parse(videoUrl));

      if (response.statusCode == 200) {
        return response.bodyBytes; // Convert response to Uint8List
      } else {
        print("Failed to load video, Status Code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error fetching video: $e");
      return null;
    }
  }


  static Future<String?> videoPicker() async {
    final XFile? galleryVideo =
    await _imagePicker.pickVideo(source: ImageSource.gallery);
    return galleryVideo?.path;
  }

  static void toast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: AppColors.primaryColor,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center",
    );


  }
  static void toastError(dynamic error) {
    var msg = '';

    if (error is Failure) {
      if (error is InternetFailure) {
        msg = 'Please check your internet';
      } else if (error is ErrorFailure) {
        msg = error.error;
      } else {
        msg = '$error';
      }
    } else if (error is String) {
      msg = error; // Directly assign if it's a string
    } else {
      msg = '$error';
    }

    // Handle special cases
    final errorValue = msg.contains('Connection closed before full header was received') ||
        msg.contains('FormatException: Unexpected character (at character 1)')
        ? 'Something went wrong! Please try again.'
        : msg.contains('Exception:')
        ? msg.replaceAll('Exception:', '').trim()
        : (msg.isEmpty ? 'An unknown error occurred' : msg);

    Fluttertoast.showToast(
      msg: errorValue,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }


 static String formatTimeToAmPm(String isoDateTimeString) {
    try {
      DateTime dateTime = DateTime.parse(isoDateTimeString);
      return DateFormat.jm().format(dateTime); // e.g., "9:29 AM"
    } catch (e) {
      return 'Invalid time';
    }
  }

 static String dateFormat(DateTime dateTime) {
   String dateTimeNow = DateFormat('MMM dd,yyyy').format(dateTime);
   
   return dateTimeNow;

  }


  static String timeAgo(String isoString) {
    try {
      DateTime dateTime = DateTime.parse(isoString).toLocal();
      final Duration diff = DateTime.now().difference(dateTime);

      if (diff.inSeconds < 60) {
        return 'Just now';
      } else if (diff.inMinutes < 60) {
        return '${diff.inMinutes} minute${diff.inMinutes == 1 ? '' : 's'} ago';
      } else if (diff.inHours < 24) {
        return '${diff.inHours} hour${diff.inHours == 1 ? '' : 's'} ago';
      } else if (diff.inDays == 1) {
        return 'Yesterday';
      } else if (diff.inDays < 7) {
        return '${diff.inDays} day${diff.inDays == 1 ? '' : 's'} ago';
      } else if (diff.inDays < 30) {
        final weeks = (diff.inDays / 7).floor();
        return '$weeks week${weeks == 1 ? '' : 's'} ago';
      } else if (diff.inDays < 365) {
        final months = (diff.inDays / 30).floor();
        return '$months month${months == 1 ? '' : 's'} ago';
      } else {
        final years = (diff.inDays / 365).floor();
        return '$years year${years == 1 ? '' : 's'} ago';
      }
    } catch (e) {
      return '';
    }
  }


  static String removeTrailingZero(String value) {
    if (value.endsWith('.0')) {
      return value.substring(0, value.length - 2);
    }
    return value;
  }

  static List<String> extractHashtags(String text) {
    final RegExp hashTagExp = RegExp(r"#\w+");
    return hashTagExp
        .allMatches(text)
        .map((match) => match.group(0)!)
        .toList();
  }


  static String getFirstIndex(String fullName) {
    if (fullName.trim().isEmpty) return "";

    // Split the name by spaces
    List<String> parts = fullName.trim().split(" ");

    // Take the first character of the first and last parts (if available)
    String first = parts[0].isNotEmpty ? parts[0][0] : "";
    String last = parts.length > 1 && parts.last.isNotEmpty ? parts.last[0] : "";

    // Combine and make uppercase
    return (first + last).toUpperCase();
  }



  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Step 1: Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('❌ Location services are disabled.');
      return null;
    }

    // Step 2: Check location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('❌ Location permission denied.');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('❌ Location permissions are permanently denied.');
      return null;
    }

    // Step 3: Get current position
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    print('✅ Current position: ${position.latitude}, ${position.longitude}');
    return position;
  }


  static Future<bool> askLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Step 1: Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('❌ Location services are disabled.');
      return false;
    }

    // Step 2: Check the current permission status
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      // Step 3: Request permission if denied
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        print('❌ Location permission denied by user.');
        return false;
      }
    }

    // Step 4: Handle permanently denied case
    if (permission == LocationPermission.deniedForever) {
      print('⚠️ Location permission permanently denied. Opening app settings...');
      await Geolocator.openAppSettings();
      return false;
    }

    // Step 5: Permission granted
    print('✅ Location permission granted.');
    return true;
  }

}


