import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Screens/A55Form_3.dart';
import 'package:mapx/Screens/A55Form_5.dart';
import 'package:mapx/Screens/SideMenu.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class A55_4Page extends StatefulWidget {
  final String area;
  final String site;
  final String chamberid;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String imagePath4;
  final String selectedTypeValue;

  const A55_4Page({
    Key? key,
    required this.area,
    required this.site,
    required this.chamberid,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.imagePath4,
    required this.selectedTypeValue,
  }) : super(key: key);

  @override
  State<A55_4Page> createState() => _A55_4PageState();
}

class _A55_4PageState extends State<A55_4Page> with SingleTickerProviderStateMixin {
  bool isMenuBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });
    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(62, 159, 71, 1.0),
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
            width: 288,
            left: isMenuBarOpen ? 0 : -288,
            height: MediaQuery.of(context).size.height,
            child: const SideMenu(itemSelected: 1),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
              offset: Offset(animation.value * 265, 0),
              child: Transform.scale(
                scale: isMenuBarOpen ? 0.8 : 1,
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(isMenuBarOpen ? 24 : 0)),
                  child: Image.asset(
                    'assets/images/white.jpeg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(animation.value - 30 * animation.value * pi / 180),
            child: Transform.translate(
                offset: Offset(animation.value * 288, 0),
                child: Transform.scale(
                    scale: isMenuBarOpen ? 0.8 : 1,
                    child: A55_4PageWidgets(
                       area: widget.area,
                      site: widget.site,
                      chamberid: widget.chamberid,
                      imagePath: widget.imagePath,
                      imagePath2: widget.imagePath2,
                      imagePath3: widget.imagePath3,
                      imagePath4: widget.imagePath4,
                      selectedTypeValue: widget.selectedTypeValue,
                    ))),
          ),
          Positioned(
            top: 10,
            left: isMenuBarOpen ? 220 : 10,
            child: SafeArea(
              child: Transform.translate(
                offset: Offset(20, 0),
                child: MenuBar(
                  isMenuBarOpen: isMenuBarOpen,
                  press: () {
                    if (isMenuBarOpen) {
                      _animationController.reverse();
                    } else {
                      _animationController.forward();
                    }
                    setState(() {
                      isMenuBarOpen = !isMenuBarOpen;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class DraftWidgets extends StatelessWidget {
//   const DraftWidgets({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             height: 100,
//           ),
//           // GridWidget()
//         ],
//       ),
//     );
//   }
// }




class CardRowWidget extends StatefulWidget {
  const CardRowWidget({Key? key, required this.row}) : super(key: key);

  final List<Draft> row;

  @override
  State<CardRowWidget> createState() => _CardRowWidget();
}

class _CardRowWidget extends State<CardRowWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [DraftCard()],
    );
  }
}

class DraftCard extends StatelessWidget {
  const DraftCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Card(
      color: Color.fromRGBO(255, 255, 255, 1.0),
      elevation: 5,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Text("Card", style: TextStyle()),
        ]),
      ),
    );
  }
}

// class _GridState extends State<GridWidget> {
//   late List<Draft> gridData = [
//     Draft(
//         id: 1,
//         form_id: 1,
//         form_name: "A55",
//         duct_section_number: "123456789",
//         site: "Islamabad",
//         cluster: "I-10",
//         date: "Marc 20, 2023",
//         time: "10:00 AM"),
//     Draft(
//         id: 1,
//         form_id: 1,
//         form_name: "A55",
//         duct_section_number: "123456789",
//         site: "Islamabad",
//         cluster: "I-10",
//         date: "Marc 20, 2023",
//         time: "10:00 AM"),
//     Draft(
//         id: 1,
//         form_id: 1,
//         form_name: "A55",
//         duct_section_number: "123456789",
//         site: "Islamabad",
//         cluster: "I-10",
//         date: "Marc 20, 2023",
//         time: "10:00 AM"),
//     Draft(
//         id: 1,
//         form_id: 1,
//         form_name: "A55",
//         duct_section_number: "123456789",
//         site: "Islamabad",
//         cluster: "I-10",
//         date: "Marc 20, 2023",
//         time: "10:00 AM"),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       // Add Expanded here
//       child: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           mainAxisSpacing: 10.0,
//           crossAxisSpacing: 10.0,
//         ),
//         itemCount: gridData.length,
//         itemBuilder: (BuildContext context, int index) {
//           return const Card(
//             color: Color.fromRGBO(255, 255, 255, 1.0),
//             elevation: 5,
//             margin: EdgeInsets.all(20),
//             child: Padding(
//               padding: EdgeInsets.all(20),
//               child: Column(children: [
//                 Text("Card", style: TextStyle()),
//               ]),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key, required this.press, required this.isMenuBarOpen})
      : super(key: key);

  final VoidCallback press;
  final bool isMenuBarOpen;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon
        SizedBox(
          height: 40,
          width: 40,
          child: GestureDetector(
            child: IconButton(
              icon: isMenuBarOpen
                  ? const ImageIcon(
                      AssetImage("assets/images/Close.png"),
                      color: Colors.white,
                    )
                  : const ImageIcon(
                      AssetImage("assets/images/Drawer.png"),
                      color: Colors.black,
                    ),
              onPressed: press,
            ),
          ),
        ),

        // Spacer to create space between icon and text
        const SizedBox(width: 8),
        Text(
          isMenuBarOpen ? "" : "A55",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ],
    );
  }
}




class A55_4PageWidgets extends StatefulWidget {
   final String area;
  final String site;
  final String chamberid;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String imagePath4;
  final String selectedTypeValue;

  const A55_4PageWidgets({
    Key? key,
    required this.area,
    required this.site,
    required this.chamberid,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.imagePath4,
    required this.selectedTypeValue,
  }) : super(key: key);


  @override
  State<A55_4PageWidgets> createState() => _A55_4PageWidgetsState();
}

class _A55_4PageWidgetsState extends State<A55_4PageWidgets> {

  GoogleMapController? mapController;

  LocationData? currentLocation;

  Location location = Location();

  Set<Marker> markers = Set<Marker>();

  List<LatLng> markerPositions = [];

  double distanceL1 = 0.0;

  double distanceL2 = 0.0;

  double distanceL3 = 0.0;

  bool isScenario1 = true; // Initially set to scenario 1

  @override
  void initState() {
    super.initState();

    location.onLocationChanged.listen((LocationData newLocation) {
      setState(() {
        currentLocation = newLocation;
      });

      if (mapController != null) {
        mapController!.animateCamera(
          CameraUpdate.newLatLng(
            LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          ),
        );
      }
    });

    // Request the user's location when the app starts

    getLocation();
  }

  Future<void> getLocation() async {
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print("Error getting location: $e");
    }
  }

   void addChamberMarker() {
    if (currentLocation != null) {
      markerPositions.add(LatLng(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
      ));

      markers.add(
        Marker(
          markerId: MarkerId(markerPositions.length.toString()),
          position: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

      updateDistances();
    }
  }

  void addBlockageMarker() {
    if (currentLocation != null) {
      markerPositions.add(LatLng(
        currentLocation!.latitude!,
        currentLocation!.longitude!,
      ));

      markers.add(
        Marker(
          markerId: MarkerId(markerPositions.length.toString()),
          position: LatLng(
            currentLocation!.latitude!,
            currentLocation!.longitude!,
          ),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
        ),
      );

      updateDistances();
    }
  }

  // void updateDistances() {

  //   if (markerPositions.length >= 4) {

  //     LatLng chamber1 = markerPositions[0];

  //     LatLng blockage1 = markerPositions[1];

  //     LatLng blockage2 = markerPositions[2];

  //     LatLng chamber2 = markerPositions[3];

  //     if (isScenario1) {

  //       // Scenario 1: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd blockage, L3 from 2nd blockage to 2nd chamber

  //       distanceL1 = calculateDistance(chamber1, blockage1);

  //       distanceL2 = calculateDistance(blockage1, blockage2);

  //       distanceL3 = calculateDistance(blockage2, chamber2);

  //     } else {

  //       // Scenario 2: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd chamber, L3 is 0

  //       distanceL1 = calculateDistance(chamber1, blockage1);

  //       distanceL3 = calculateDistance(blockage1, chamber2);

  //       distanceL2 = 0.0;

  //     }

  //   } else {

  //     // Reset distances when not enough markers

  //     distanceL1 = 0.0;

  //     distanceL2 = 0.0;

  //     distanceL3 = 0.0;

  //   }

  //   updatePolylines();

  // }

 void updateDistances() {

  if (markerPositions.length >= 4) {

    LatLng chamber1 = markerPositions[0];

    LatLng blockage1 = markerPositions[1];

    LatLng blockage2 = markerPositions[2];

    LatLng chamber2 = markerPositions[3];

 

  

      // Scenario 1: L1 from 1st chamber to 1st blockage, L2 from 1st blockage to 2nd blockage, L3 from 2nd blockage to 2nd chamber

      distanceL1 = calculateDistance(chamber1, blockage1);

      distanceL2 = calculateDistance(blockage1, blockage2);

      distanceL3 = calculateDistance(blockage2, chamber2);

    

  } else if (markerPositions.length >= 3) {

    LatLng chamber1 = markerPositions[0];

    LatLng blockage1 = markerPositions[1];

    LatLng chamber2 = markerPositions[2];

 

    distanceL1 = calculateDistance(chamber1, blockage1);

    distanceL3 =calculateDistance(blockage1, chamber2);

    distanceL2 = 0.0;

  } else {

    // Reset distances when not enough markers

    distanceL1 = 0.0;

    distanceL2 = 0.0;

    distanceL3 = 0.0;

  }

 

  updatePolylines();

}  void updatePolylines() {
    polylines.clear();

    if (markerPositions.length >= 2) {
      for (int i = 0; i < markerPositions.length - 1; i++) {
        LatLng p1 = markerPositions[i];

        LatLng p2 = markerPositions[i + 1];

        Polyline polyline = Polyline(
          polylineId: PolylineId('path$i'),
          color: Colors.blue,
          width: 5,
          points: [p1, p2],
        );

        polylines.add(polyline);
      }
    }
  }

  double calculateDistance(LatLng p1, LatLng p2) {
    const double earthRadius = 6371000; // Earth's radius in meters

    double lat1 = p1.latitude * pi / 180.0;

    double lon1 = p1.longitude * pi / 180.0;

    double lat2 = p2.latitude * pi / 180.0;

    double lon2 = p2.longitude * pi / 180.0;

    double dLat = lat2 - lat1;

    double dLon = lon2 - lon1;

    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);

    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    double distance = earthRadius * c;

    return distance;
  }

  Set<Polyline> polylines = Set<Polyline>();



   File? _image;
  int _selectedTypeIndex = -1; // Initialize with an invalid value
  // String? image_chamber;

  Future<void> sendFormData(String area, String site, String chamber1_id,
      String imagePath,  String imagePath2,  String imagePath3,  String imagePath4, String selectedType) async {
    String? image_chamber =
        _image != null ? base64Encode(_image!.readAsBytesSync()) : null;

    final apiUrl =
        "https://test2.nets-x-map.com/mobileA55Post"; // Replace with your API URL

    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'area': area,
      'site': site,
      'chamber1': chamber1_id,
      'chamber1_1': imagePath,
      'chamber1_2': imagePath2,
      'chamber1_3': imagePath3,
      'chamber1_4': imagePath4,
      'selectedType': selectedType,
    }); // Use jsonEncode to format the body

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Data successfully sent to the server
      print("Data submitted successfully!");
    } else {
      // Handle error
      // print("Error submitting data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }
  @override
  Widget build(BuildContext context) {
     String area = widget.area; // Access the area from the widget's parameters
    String site = widget.site;
    String chamberid = widget.chamberid;
    String imagePath = widget.imagePath;
    String imagePath2 = widget.imagePath2;
    String imagePath3 = widget.imagePath3;
    String imagePath4 = widget.imagePath4;
    String selectedTypeValue = widget.selectedTypeValue;

    return Scaffold(
      
      body: Padding(
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:120),
              Center(
                child: Text(
                  "Please fill in one form per blockage",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF6EB544),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Container(
                  height: 520,
                  child:GoogleMap(
              onMapCreated: (controller) {
                setState(() {
                  mapController = controller;
                });
              },
              initialCameraPosition: currentLocation != null
                  ? CameraPosition(
                      target: LatLng(
                        currentLocation!.latitude!,
                        currentLocation!.longitude!,
                      ),
                      zoom: 15.0,
                    )
                  : CameraPosition(
                      target: LatLng(0, 0),
                      zoom: 15.0,
                    ),
              myLocationEnabled: true,
              markers: markers,
              polylines: polylines,
               zoomControlsEnabled: true,
            ),
                ),
              ),
        
              SizedBox(height: 25), // Adding spacing
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                ElevatedButton(
                   onPressed: addChamberMarker ,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xfff3f3f3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt, // Your desired icon
                        color: Colors.green, // Icon color set to green
                      ),
                      SizedBox(width: 8), // Adding space between icon and text
                      Text(
                        'Add Chamber',
                        style: TextStyle(
                          color: Color(0xFF656565), // Text color
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                   onPressed: addBlockageMarker ,
                 
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xfff3f3f3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check, // Your desired icon
                        color: Colors.green, // Icon color set to green
                      ),
                      SizedBox(width: 8), // Adding space between icon and text
                      Text(
                        'Add Blockage',
                        style: TextStyle(
                          color: Color(0xFF656565), // Text color
                        ),
                      ),
                    ],
                  ),
                )
              ]),
              SizedBox(height: 35),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 20), // Add space between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your onPressed logic here
             Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => A55_3Page(formData: '',formsite:''),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.green,
                      ),
                      child: Text("BACK"),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20), // Add space between buttons
                    child: ElevatedButton(
                      onPressed: ()async {
                        // Navigate to the new screen A55Form_3
                         // Call the API function to send the form data
                         print("$imagePath");
                         print("$imagePath2");
                         print("$imagePath3");
                         print("$imagePath4");
                      await sendFormData(area, site, chamberid,
                         imagePath,imagePath2,imagePath3,imagePath4 ,selectedTypeValue);
        
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => A55_5Page(
                              area: area,
                            site: site,
                            chamberid: chamberid,
                            imagePath: imagePath,
                            imagePath2: imagePath,
                            imagePath3: imagePath,
                            imagePath4: imagePath,
                            selectedTypeValue: selectedTypeValue,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        onPrimary: Colors.white,
                      ),
                      child: Text("NEXT"),
                    ),
                  ),
                ],
              ),
              //  SizedBox(height: 16),
              //   Text('L1 Distance: ${distanceL1.toStringAsFixed(2)} meters'),
              //   Text('L2 Distance: ${distanceL2.toStringAsFixed(2)} meters'),
              //   Text('L3 Distance: ${distanceL3.toStringAsFixed(2)} meters'),
            ],
          ),
        ),
      ),
    );
  }
}