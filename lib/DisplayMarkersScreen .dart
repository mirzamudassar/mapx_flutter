// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class DisplayMarkersScreen extends StatefulWidget {
//   final Set<Marker> markers;
//   final Set<Polyline> polylines;
//   final double distanceL1;
//   final double distanceL2;
//   final double distanceL3;
//   final LatLng currentLocation;
//   LatLng? blockageMarkerPosition;
//
//   DisplayMarkersScreen({
//     required this.markers,
//     required this.polylines,
//     required this.distanceL1,
//     required this.distanceL2,
//     required this.distanceL3,
//     required this.currentLocation,
//     this.blockageMarkerPosition,
//   });
//
//   @override
//   _DisplayMarkersScreenState createState() => _DisplayMarkersScreenState();
// }
//
// class _DisplayMarkersScreenState extends State<DisplayMarkersScreen> {
//   GoogleMapController? _mapController;
//   Set<Marker> redMarkers = {};
//   Set<Marker> yellowMarkers = {};
//   CameraPosition? _cameraPosition; // Store the camera position
//
//   void _addRedMarker() {
//     setState(() {
//       redMarkers.add(
//         Marker(
//           markerId: MarkerId('redMarker${redMarkers.length}'),
//           position: widget.currentLocation,
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ),
//       );
//     });
//   }
//
//  void _addYellowMarker() {
//   if (_cameraPosition != null) {
//     setState(() {
//       yellowMarkers.add(
//         Marker(
//           markerId: MarkerId('yellowMarker${yellowMarkers.length}'),
//           position: LatLng(_cameraPosition!.target.latitude, _cameraPosition!.target.longitude),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
//         ),
//       );
//     });
//   }
// }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Markers and Distances'),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: GoogleMap(
//               onMapCreated: (controller) {
//                 setState(() {
//                   _mapController = controller;
//                 });
//               },
//               onCameraMove: (position) {
//                 // Update the camera position
//                 _cameraPosition = position;
//               },
//               initialCameraPosition: CameraPosition(
//                 target: widget.currentLocation,
//                 zoom: 15.0,
//               ),
//               markers: {...widget.markers, ...redMarkers, ...yellowMarkers},
//               polylines: widget.polylines,
//               myLocationEnabled: true,
//               myLocationButtonEnabled: true,
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _addRedMarker,
//                 child: Text('Add Chamber'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _addYellowMarker();
//                 },
//                 child: Text('Blockage'),
//               ),
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('L1 Distance: ${widget.distanceL1.toStringAsFixed(2)} meters'),
//                 Text('L2 Distance: ${widget.distanceL2.toStringAsFixed(2)} meters'),
//                 Text('L3 Distance: ${widget.distanceL3.toStringAsFixed(2)} meters'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
