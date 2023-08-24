import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'A55Form_6.dart';

class A55Form_5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A55_FORM 5'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                height: 450,
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
            SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic for the "Add Chamber" button
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFECFFD9),
                  onPrimary: Color(0xff555555),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color(0xFF7FBE42), // Set the border color here
                    ),
                  ),
                  minimumSize: Size(350, 40), // Set the minimum width here
                ),
                child: Row(
                  children: [
                    Icon(Icons.add), // Add icon on the left
                    SizedBox(
                      width: 8, // Adjust spacing as needed
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8), // Adjust left padding
                      child: Text("Add Chamber"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Logic for the "Add Blockage" button
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xfff7fbf7),
                  onPrimary: Color(0xff555555),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Color(0xFF7FBE42), // Set the border color here
                    ),
                  ),
                  minimumSize: Size(350, 40), // Set the minimum width here
                ),
                child: Row(
                  children: [
                    Icon(Icons.add), // Add icon on the left
                    SizedBox(
                      width: 8, // Adjust spacing as needed
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8), // Adjust left padding
                      child: Text("Add Blockage"),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
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
                  padding:
                      EdgeInsets.only(left: 20), // Add space between buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the new screen A55Form_3
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => A55Form_6(),
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
      ),
    );
  }
}
