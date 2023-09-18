// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'dart:math';
// import 'package:mapx/DisplayMarkersScreen%20.dart'; // Make sure the path is correct
//
// // Import the new screen file
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   GoogleMapController? mapController;
//
//   LocationData? currentLocation;
//
//   Location location = Location();
//
//   Set<Marker> markers = Set<Marker>();
//
//   List<LatLng> markerPositions = [];
//
//   double distanceL1 = 0.0;
//
//   double distanceL2 = 0.0;
//
//   double distanceL3 = 0.0;
//
//   bool isChamberAdded = false;
//   bool isBlockageAdded = false;
//
//   @override
//   void initState() {
//     super.initState();
//
//     location.onLocationChanged.listen((LocationData newLocation) {
//       setState(() {
//         currentLocation = newLocation;
//       });
//
//       if (mapController != null) {
//         mapController!.animateCamera(
//           CameraUpdate.newLatLng(
//             LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
//           ),
//         );
//       }
//     });
//
//     // Request the user's location when the app starts
//
//     getLocation();
//   }
//
//   Future<void> getLocation() async {
//     try {
//       currentLocation = await location.getLocation();
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//   }
//
//   void addChamberMarker() {
//     if (!isChamberAdded && currentLocation != null) {
//       markerPositions.add(LatLng(
//         currentLocation!.latitude!,
//         currentLocation!.longitude!,
//       ));
//
//       markers.add(
//         Marker(
//           markerId: MarkerId('chamber'),
//           position: LatLng(
//             currentLocation!.latitude!,
//             currentLocation!.longitude!,
//           ),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ),
//       );
//
//       isChamberAdded = true;
//       updateDistances();
//     }
//   }
//
//   void addBlockageMarker() {
//     if (!isBlockageAdded && currentLocation != null) {
//       markerPositions.add(LatLng(
//         currentLocation!.latitude!,
//         currentLocation!.longitude!,
//       ));
//
//       markers.add(
//         Marker(
//           markerId: MarkerId('blockage'),
//           position: LatLng(
//             currentLocation!.latitude!,
//             currentLocation!.longitude!,
//           ),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
//         ),
//       );
//
//       isBlockageAdded = true;
//       updateDistances();
//     }
//   }
//
//   void updateDistances() {
//     if (isChamberAdded && markerPositions.length >= 2) {
//       LatLng chamber = markerPositions.firstWhere(
//           (element) => element == markerPositions[0],
//           orElse: () => LatLng(0, 0));
//
//       LatLng blockage = markerPositions.firstWhere(
//           (element) => element == markerPositions[1],
//           orElse: () => LatLng(0, 0));
//
//       distanceL1 = calculateDistance(chamber, blockage);
//       distanceL2 = 0.0;
//       distanceL3 = 0.0;
//     } else {
//       // Reset distances when not enough markers
//       distanceL1 = 0.0;
//       distanceL2 = 0.0;
//       distanceL3 = 0.0;
//     }
//
//     updatePolylines();
//   }
//
//   void updatePolylines() {
//     polylines.clear();
//
//     if (markerPositions.length >= 2) {
//       for (int i = 0; i < markerPositions.length - 1; i++) {
//         LatLng p1 = markerPositions[i];
//         LatLng p2 = markerPositions[i + 1];
//
//         Polyline polyline = Polyline(
//           polylineId: PolylineId('path$i'),
//           color: Colors.blue,
//           width: 5,
//           points: [p1, p2],
//         );
//
//         polylines.add(polyline);
//       }
//     }
//   }
//
//   double calculateDistance(LatLng p1, LatLng p2) {
//     const double earthRadius = 6371000; // Earth's radius in meters
//
//     double lat1 = p1.latitude * pi / 180.0;
//     double lon1 = p1.longitude * pi / 180.0;
//     double lat2 = p2.latitude * pi / 180.0;
//     double lon2 = p2.longitude * pi / 180.0;
//
//     double dLat = lat2 - lat1;
//     double dLon = lon2 - lon1;
//
//     double a = sin(dLat / 2) * sin(dLat / 2) +
//         cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
//
//     double c = 2 * atan2(sqrt(a), sqrt(1 - a));
//
//     double distance = earthRadius * c;
//
//     return distance;
//   }
//
//   Set<Polyline> polylines = Set<Polyline>();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Google Maps with Distances and Polylines'),
//         ),
//         body: Stack(
//           children: <Widget>[
//             GoogleMap(
//               onMapCreated: (controller) {
//                 setState(() {
//                   mapController = controller;
//                 });
//               },
//               initialCameraPosition: currentLocation != null
//                   ? CameraPosition(
//                       target: LatLng(
//                         currentLocation!.latitude!,
//                         currentLocation!.longitude!,
//                       ),
//                       zoom: 15.0,
//                     )
//                   : CameraPosition(
//                       target: LatLng(0, 0),
//                       zoom: 15.0,
//                     ),
//               myLocationEnabled: true,
//               markers: markers,
//               polylines: polylines,
//             ),
//
//
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ElevatedButton(
//                       onPressed: addChamberMarker,
//                       child: Text('Add Chamber'),
//                       style: ElevatedButton.styleFrom(primary: Colors.red),
//                     ),
//                     ElevatedButton(
//                       onPressed: addBlockageMarker,
//                       child: Text('Add Blockage'),
//                       style: ElevatedButton.styleFrom(primary: Colors.yellow),
//                     ),
//                   ],
//                 ),
//              ElevatedButton(
//   onPressed: () {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => DisplayMarkersScreen(
//           markers: markers,
//           polylines: polylines,
//           distanceL1: distanceL1,
//           distanceL2: distanceL2,
//           distanceL3: distanceL3,
//           currentLocation: LatLng(
//             currentLocation!.latitude!,
//             currentLocation!.longitude!,
//           ),
//         ),
//       ),
//     );
//   },
//   child: Text('Show Markers and Distances'),
//   style: ElevatedButton.styleFrom(primary: Colors.blue),
// ),
//
//
//
//                 SizedBox(height: 16),
//
//                 Text('L1 Distance: ${distanceL1.toStringAsFixed(2)} meters'),
//                 Text('L2 Distance: ${distanceL2.toStringAsFixed(2)} meters'),
//                 Text('L3 Distance: ${distanceL3.toStringAsFixed(2)} meters'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }
