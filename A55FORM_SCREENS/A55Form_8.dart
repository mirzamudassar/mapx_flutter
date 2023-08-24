import 'package:flutter/material.dart';
import 'A55Form_9.dart';

class A55Form_8 extends StatefulWidget {
  @override
  State<A55Form_8> createState() => _A55Form_8State();
}

class _A55Form_8State extends State<A55Form_8> {
  String? value_radio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FORM 8'),
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
                    padding: const EdgeInsets.only(left: 20),
                    child: Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 290,
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color(0xFFBEC5BE),
                    ),
                  ),
                  Container(
                    width: 40,
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
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 40), // Default space between lines
                      Text(
                        'Measurement',
                        style: TextStyle(fontSize: 10),
                      ),
                      SizedBox(width: 40), // Default space between lines
                      Text(
                        'Images',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cluster",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
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
                    labelText: 'Cluster 26',
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
              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Work Required",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFC0D4AC),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "ancilliary",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("Ancilliary"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 1,
                          color: Color(0xFFC0D4AC),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "blockage",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("Blockage"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Exchange",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding spacing

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Exchange Name',
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Onsite Engineer",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding spacing

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Onsite Engineer Details',
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Telephone No",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding spacing

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Onsite Telephone No',
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
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "PIA Order No",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10), // Adding spacing

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter PIA Order No',
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
              SizedBox(height: 20), // Adding spacing

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
                            builder: (context) => A55Form_9(),
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
        ],
      ),
    );
  }
}
