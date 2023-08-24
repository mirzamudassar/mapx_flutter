import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'A55Form_5.dart';

class A55Form_4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A55_FORM 4'),
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
                height: 520,
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

            SizedBox(height: 25), // Adding spacing
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                      'Add Blockage',
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
                      'Add Chamber',
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
                          builder: (context) => A55Form_5(),
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
