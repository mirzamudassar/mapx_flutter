import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'A55Form_4.dart';

class A55Form_3 extends StatefulWidget {
  @override
  _A55Form_3State createState() => _A55Form_3State();
}

class _A55Form_3State extends State<A55Form_3> {
  List<bool> _isSelected = [false, false, false]; // Track button selection

  void _onButtonPressed(int index) {
    setState(() {
      for (int buttonIndex = 0;
          buttonIndex < _isSelected.length;
          buttonIndex++) {
        if (buttonIndex == index) {
          _isSelected[buttonIndex] = !_isSelected[buttonIndex];
        } else {
          _isSelected[buttonIndex] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Example'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.topCenter,
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: double.infinity,
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(45.521563, -122.677433),
                  zoom: 11.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
              ),
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
                  onPressed: () {
                    // Navigate to the new screen A55Form_3
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => A55Form_4(),
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
