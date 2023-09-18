import 'dart:convert';
import 'dart:math';
import 'dart:convert'; // Import the dart:convert package
import 'package:flutter/material.dart';

import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Screens/Dashboard.dart';
import 'package:mapx/Screens/SideMenu.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
import 'package:motion_toast/motion_toast.dart';
import 'A55Form_3.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';


class A55_2Page extends StatefulWidget {
  const A55_2Page ({super.key});

  @override
  State<A55_2Page> createState() => _A55_2PageState();
}

class _A55_2PageState extends State<A55_2Page> with SingleTickerProviderStateMixin {
  bool isMenuBarOpen = false;
  late AnimationController _animationController;
  late Animation<double> animation;
  
  get http => null;



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
                    child: const A55_2PageWidgets())),
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


class A55_2PageWidgets extends StatefulWidget {
  const A55_2PageWidgets ({Key? key}) : super(key: key);

  @override
  State<A55_2PageWidgets> createState() => _A55_2PageWidgetsState();
}

class _A55_2PageWidgetsState extends State<A55_2PageWidgets> {

   GoogleMapController? mapController;

  LocationData? currentLocation;

  Location location = Location();


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

Future<void> sendFormData(String area,String site) async {
  final apiUrl = "https://test2.nets-x-map.com/mobileA55Post"; // Replace with your API URL

  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'area': area,'site':site}); // Use jsonEncode to format the body

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Data successfully sent to the server
    print("Data submitted successfully!");
  } else {
    // Handle error
    // print("Error submitting data. Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}




 final _formKey = GlobalKey<FormState>(); // Define a form key
  final TextEditingController? _areaController = TextEditingController();
  final TextEditingController? _siteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Padding(
        padding: EdgeInsets.all(20),
       
        child: Form(
           key: _formKey, // Assign the form key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height:40),
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
              Expanded(
                child:  GoogleMap(
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
            )
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Area",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _areaController,
                decoration: InputDecoration(
                  labelText: "Enter area of blockage",
                  labelStyle: TextStyle(
                    color: Color(0xff727171), // Font color
                    fontSize: 12, // Font size
                  ),
                
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: Colors.green,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // <- Add this line
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                    icon: Icon(Icons.edit),
                  ),
                ),
               validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return '*';
                  }
                  return null;
                },
              ),
               SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Select Site",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _siteController,
                decoration: InputDecoration(
                  labelText: "Enter site",
                  labelStyle: TextStyle(
                    color: Color(0xff727171), // Font color
                    fontSize: 12, // Font size
                  ),
                
                
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none, // Remove the border
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  floatingLabelBehavior:
                      FloatingLabelBehavior.never, // <- Add this line
        
                ),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return '*';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: 20), // Add space between buttons
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Dashboard(),
                          ),
                        );
                        // Add your onPressed logic here
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
                      onPressed: () async {
                        // Navigate to the new screen A55Form_3

                        if (_formKey.currentState?.validate() ?? false) {
                        String? area = _areaController?.text;
                        String? site = _siteController?.text;
                        await sendFormData(area!, site!);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => A55_3Page(
                              formData: area,
                              formsite: site,
                            ),
                          ),
                        );
                      }
                      else{
                         MotionToast.error(
                                title: Text("Missing Fields"),
                                description: Text("Please fill missing required Fields"))
                            .show(context);
                      }

            //          String? area = _areaController?.text;
            //             String? site = _siteController?.text;
            //          print("Area value: $area"); // Print the area value to the console
            //          print("Area value: $site"); // Print the area value to the console
        
        
            // // Call the API function to send the form data
            // await sendFormData(area!,site!);
        
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                 builder: (context) => A55_3Page(formData: area,formsite: site, ),
            //               ),
            //             );
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
              SizedBox(height:20),
            ],
          ),
        ),
      ),
    );
  }
}


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