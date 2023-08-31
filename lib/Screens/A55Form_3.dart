import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Screens/A55Form_2.dart';
import 'package:mapx/Screens/SideMenu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'A55Form_4.dart';
import 'package:http/http.dart' as http;

class A55_3Page extends StatefulWidget {

  final String formData;
  final String formsite;

  
  const A55_3Page({
    Key? key, required this.formData,required this.formsite,
 
  }) : super(key: key);

  @override
  State<A55_3Page> createState() => _A55_3PageState();
}

class _A55_3PageState extends State<A55_3Page> with SingleTickerProviderStateMixin {
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
   // Access the site from the widget's parameters

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
                    child: A55_3PageWidgets(formData: widget.formData,formsite:widget.formsite))),  // Pass formData here
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






class A55_3PageWidgets extends StatefulWidget {
   const A55_3PageWidgets({Key? key, required this.formData,required this.formsite,}) : super(key: key);

  final String formData;
  final String formsite;

  
  @override
  _A55_3PageWidgetsState createState() => _A55_3PageWidgetsState();
}

class _A55_3PageWidgetsState extends State<A55_3PageWidgets> {

// Initialize with an invalid value
  File? _image;
   int _selectedTypeIndex = -1; // Initialize with an invalid value
  // String? image_chamber;
  

  Future<void> sendFormData(String area,String site,String chamber1_id,String chamber1_image,String selectedType) async {


  String? image_chamber = _image != null ? base64Encode(_image!.readAsBytesSync()) : null;


  final apiUrl = "https://test2.nets-x-map.com/mobileA55Post"; // Replace with your API URL

  final headers = {'Content-Type': 'application/json'};
  final body = jsonEncode({'area': area,'site':site,'chamber1':chamber1_id,'chamber1_1':image_chamber,'selectedType': selectedType,}); // Use jsonEncode to format the body

  final response = await http.post(Uri.parse(apiUrl), headers: headers, body: body);

  if (response.statusCode == 200) {
    // Data successfully sent to the server
    print("Data submitted successfully!");
  } else {
    // Handle error
    print("Error submitting data. Status code: ${response.statusCode}");
    print("Response body: ${response.body}");
  }
}
final TextEditingController _chamberidController = TextEditingController();


 List<bool> _isSelected = [false, false, false]; // Track button selection

  // void _onButtonPressed(int index) {
  //   setState(() {
  //     for (int buttonIndex = 0;
  //         buttonIndex < _isSelected.length;
  //         buttonIndex++) {
  //       if (buttonIndex == index) {
  //         _isSelected[buttonIndex] = !_isSelected[buttonIndex];
  //       } else {
  //         _isSelected[buttonIndex] = false;
  //       }
  //     }
  //   });
  // }
  void _onButtonPressed(int index) {
  setState(() {
    for (int buttonIndex = 0; buttonIndex < _isSelected.length; buttonIndex++) {
      if (buttonIndex == index) {
        _isSelected[buttonIndex] = !_isSelected[buttonIndex];
        _selectedTypeIndex = index; // Store the selected type index
      } else {
        _isSelected[buttonIndex] = false;
      }
    }
  });
}



  Future<void> _pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage( source: ImageSource.gallery, maxWidth: 180,
      maxHeight: 180);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     String area = widget.formData; // Access the area from the widget's parameters
    String site = widget.formsite; 
    return Scaffold(
   
      body: Column(
        children: [
          SizedBox(height:120),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Please Form Data: ${widget.formData} and ${widget.formsite}",
              // "Please fill in one form per Blockage",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xFF6EB544),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 300,
              child: FlutterMap(
            options: MapOptions(
              center: LatLng(51.509364, -0.128928),
              zoom: 3.2,
            ),
            children: [
              TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.app',
              ),
            ],
          )
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Type",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ToggleButtonGroup(
            isSelected: _isSelected,
            onPressed: _onButtonPressed,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter Chamber 1 ID",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Adding spacing

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
               controller: _chamberidController,
              decoration: InputDecoration(
                labelText: 'Enter Chamber 1 ID',
                labelStyle: TextStyle(
                  color: Color(0xff727171), // Font color
                  fontSize: 12, // Font size
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFFC0D4AC), // Border color
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    color: Color(0xFFC0D4AC), // Border color
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Select Image",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Adding spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                   _pickImage(ImageSource.gallery);
                },
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
                      'Upload File',
                      style: TextStyle(
                        color: Color(0xFF656565), // Text color
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add your onPressed logic here
                },
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
                      'Take Image',
                      style: TextStyle(
                        color: Color(0xFF656565), // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
                    
                    // Add your onPressed logic here
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => A55_2Page(),
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
                padding: EdgeInsets.only(left: 20), // Add space between buttons
                child: ElevatedButton(
                  onPressed: () async{
                    // Navigate to the new screen A55Form_3
                     String chamberid= _chamberidController.text;

                    String selectedTypeValue = "";

    if (_selectedTypeIndex == 0) {
      selectedTypeValue = "l1_soft";
    } else if (_selectedTypeIndex == 1) {
      selectedTypeValue = "l1_footway";
    } else if (_selectedTypeIndex == 2) {
      selectedTypeValue = "l1_carriageway";
    }



  
                   print("chamber id value: $chamberid"); // Print the area value to the console/ Print the area value to the console
                   print("area value: $area"); // Print the area value to the console/ Print the area value to the console
                   print("site value: $site"); // Print the area value to the console/ Print the area value to the console

                   print("_image value: ${_image?.path}"); // Print the area value to the console/ Print the area value to the console
                   print("type value: $selectedTypeValue"); // Print the area value to the console/ Print the area value to the console


    // Call the API function to send the form data
    await sendFormData(area, site, chamberid, _image?.path ?? "", selectedTypeValue);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => A55_4Page(),
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
        ],
      ),
    );
  }
}


class ToggleButtonGroup extends StatelessWidget {
  final List<bool> isSelected;
  final Function(int) onPressed;

  const ToggleButtonGroup({
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(8),
      selectedColor: Colors.white,
      fillColor: Colors.green,
      borderColor: Color(0xFFC0D4AC), // Border color for unselected buttons
      borderWidth: 2, // Border width for unselected buttons
      isSelected: isSelected,
      color: Color(0xFFC0D4AC),
      // selectedBorderColor:
      //     Color(0xFFC0D4AC), // Border color for selected buttons

      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Soft"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Footway"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Carriageway"),
        ),
      ],
      onPressed: onPressed,
    );
  }
}
