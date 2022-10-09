// import 'dart:async';
// import 'package:geolocator/geolocator.dart';
// import 'package:location/location.dart';
// import 'package:flutter/services.dart';

// class GeolocationService {
//   static final GeolocationService _shared = GeolocationService._internal();
//   static GeolocationService get shared => _shared;

//   final Location locationService = Location();
//   LocationData? currentLocation;
//   PermissionStatus? _permission;
//   StreamSubscription<LocationData>? _locationSubscription;

//   factory GeolocationService() {
//     return _shared;
//   }

//   GeolocationService._internal();
//   Future<LocationData?> getCurrentLocation() async {
//     try {
//       Position? _currentPosition = await Geolocator.getCurrentPosition();

//       LocationData locationData = LocationData.fromMap({
//         'latitude': _currentPosition.latitude,
//         'longitude': _currentPosition.longitude,
//         'accuracy': _currentPosition.accuracy,
//         'altitude': _currentPosition.altitude,
//         'speed': _currentPosition.speed,
//         'speed_accuracy': _currentPosition.speedAccuracy,
//         'heading': _currentPosition.heading,
//       });

//       return locationData;
//     } catch (exception) {
//       return null;
//     }
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     await locationService.changeSettings();

//     await getCurrentLocation();

//     LocationData? location;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       bool serviceStatus = await locationService.serviceEnabled();
//       if (serviceStatus) {
//         _permission = await locationService.requestPermission();
//         var gotPermission = await locationService.hasPermission();
//         bool requestService = await locationService.requestService();
//         if (_permission == PermissionStatus.granted) {
//           location = (await getCurrentLocation())!;

//           currentLocation = location;

//           _locationSubscription = locationService.onLocationChanged
//               .listen((LocationData result) async {
//             currentLocation = result;
//           });
//         }
//       } else {
//         bool serviceStatusResult = await locationService.requestService();
//         if (serviceStatusResult) {
//           initPlatformState();
//         }
//       }
//     } on PlatformException catch (e) {
//       if (e.code == 'PERMISSION_DENIED') {
//         // Need to print that error
// //        error = e.message;
//       } else if (e.code == 'SERVICE_STATUS_ERROR') {
//         // Need to print that error
// //        error = e.message;
//       }
//       location = null;
//     }
//   }

//   Future<double> calculateDistance(
//       double distantLat, double distantLong) async {
//     if (currentLocation == null) {
//       return 0;
//     }
//     return Geolocator.distanceBetween(currentLocation!.latitude ?? 0,
//         currentLocation!.longitude ?? 0, distantLat, distantLong);
//   }
// }