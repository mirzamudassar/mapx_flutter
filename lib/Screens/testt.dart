// import 'package:flutter/material.dart';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'package:location/location.dart';
//
// import 'dart:math';
//
// void main() => runApp(MyApp());
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
//   bool isScenario1 = true; // Initially set to scenario 1
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
//     if (currentLocation != null) {
//       markerPositions.add(LatLng(
//         currentLocation!.latitude!,
//         currentLocation!.longitude!,
//       ));
//
//       markers.add(
//         Marker(
//           markerId: MarkerId(markerPositions.length.toString()),
//           position: LatLng(
//             currentLocation!.latitude!,
//             currentLocation!.longitude!,
//           ),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ),
//       );
//
//       updateDistances();
//     }
//   }
//
//   void addBlockageMarker() {
//     if (currentLocation != null) {
//       markerPositions.add(LatLng(
//         currentLocation!.latitude!,
//         currentLocation!.longitude!,
//       ));
//
//       markers.add(
//         Marker(
//           markerId: MarkerId(markerPositions.length.toString()),
//           position: LatLng(
//             currentLocation!.latitude!,
//             currentLocation!.longitude!,
//           ),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
//         ),
//       );
//
//       updateDistances();
//     }
//   }
//
//   // void updateDistances() {
//
//   //   if (markerPositions.length >= 4) {
//
//   //     LatLng chamber1 = markerPositions[0];
//
//   //     LatLng blockage1 = markerPositions[1];
//
//   //     LatLng blockage2 = markerPositions[2];
//
//   //     LatLng chamber2 = markerPositions[3];
//
//   //     if (isScenario1) {
//
//   //       // Scenario 1: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd blockage, L3 from 2nd blockage to 2nd chamber
//
//   //       distanceL1 = calculateDistance(chamber1, blockage1);
//
//   //       distanceL2 = calculateDistance(blockage1, blockage2);
//
//   //       distanceL3 = calculateDistance(blockage2, chamber2);
//
//   //     } else {
//
//   //       // Scenario 2: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd chamber, L3 is 0
//
//   //       distanceL1 = calculateDistance(chamber1, blockage1);
//
//   //       distanceL3 = calculateDistance(blockage1, chamber2);
//
//   //       distanceL2 = 0.0;
//
//   //     }
//
//   //   } else {
//
//   //     // Reset distances when not enough markers
//
//   //     distanceL1 = 0.0;
//
//   //     distanceL2 = 0.0;
//
//   //     distanceL3 = 0.0;
//
//   //   }
//
//   //   updatePolylines();
//
//   // }
//
//   void updateDistances() {
//     if (markerPositions.length >= 4) {
//       LatLng chamber1 = markerPositions[0];
//
//       LatLng blockage1 = markerPositions[1];
//
//       LatLng blockage2 = markerPositions[2];
//
//       LatLng chamber2 = markerPositions[3];
//
//       // Scenario 1: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd blockage, L3 from 2nd blockage to 2nd chamber
//
//       distanceL1 = calculateDistance(chamber1, blockage1);
//
//       distanceL2 = calculateDistance(blockage1, blockage2);
//
//       distanceL3 = calculateDistance(blockage2, chamber2);
//     } else if (markerPositions.length >= 3) {
//       LatLng chamber1 = markerPositions[0];
//
//       LatLng blockage1 = markerPositions[1];
//
//       LatLng chamber2 = markerPositions[2];
//
//       distanceL1 = calculateDistance(chamber1, blockage1);
//
//       distanceL3 = calculateDistance(blockage1, chamber2);
//
//       distanceL2 = 0.0;
//     } else {
//       // Reset distances when not enough markers
//
//       distanceL1 = 0.0;
//
//       distanceL2 = 0.0;
//
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
//
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
//
//     double lon1 = p1.longitude * pi / 180.0;
//
//     double lat2 = p2.latitude * pi / 180.0;
//
//     double lon2 = p2.longitude * pi / 180.0;
//
//     double dLat = lat2 - lat1;
//
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
//                 SizedBox(height: 16),
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
