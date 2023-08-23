import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class A55Form_11 extends StatefulWidget {
  @override
  State<A55Form_11> createState() => _A55Form_11State();
}

class _A55Form_11State extends State<A55Form_11> {
  String? value_radio;
  File? _selectedImage;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A10 FORM'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 270),
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 260,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFBEC5BE),
                    ),
                  ),
                  Container(
                    width: 290,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFF3D9F46),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 2), // Add space between lines and text
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(
                      right: 10, left: 40), // Increase left padding here
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Site',
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      ),
                      SizedBox(width: 40), // Increase space between lines
                      Text(
                        'Cabling',
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      ),
                      SizedBox(width: 40), // Default space between lines
                      Text(
                        'Measurement',
                        style: TextStyle(
                          fontSize: 10,
                          color: Color(
                            0xFF3D9F46,
                          ),
                        ),
                      ),
                      SizedBox(width: 40), // Default space between lines
                      Text(
                        'Images',
                        style: TextStyle(fontSize: 10, color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 250),
              Center(
                child: ElevatedButton(
                  onPressed: _uploadImage, // Call the _uploadImage function
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFECFFD9),
                    onPrimary: Color(0xff555555),
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: Color(0xFF7FBE42), // Set the border color here
                      ),
                    ),
                    minimumSize: Size(300, 40), // Set the minimum width here
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 1),
                      Padding(
                        padding: EdgeInsets.only(left: 45),
                        child: Text("Upload File"),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 250),
              Center(
                child: ElevatedButton(
                  onPressed: _uploadImage, // Call the _uploadImage function
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
                    minimumSize: Size(300, 40), // Set the minimum width here
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 1),
                      Padding(
                        padding: EdgeInsets.only(left: 45),
                        child: Text("Upload File"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
