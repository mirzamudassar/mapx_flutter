import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'A55Form_3.dart';

class A55Form_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A55_FORM 2'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
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
            Expanded(
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(45.521563, -122.677433),
                  zoom: 13.0,
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                  ),
                ],
              ),
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
                  padding:
                      EdgeInsets.only(left: 20), // Add space between buttons
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the new screen A55Form_3
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => A55Form_3(),
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
