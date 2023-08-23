import 'package:flutter/material.dart';
import 'A55Form_10.dart';

class A55Form_9 extends StatefulWidget {
  @override
  State<A55Form_9> createState() => _A55Form_9State();
}

class _A55Form_9State extends State<A55Form_9> {
  String? value_radio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
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
                    padding: const EdgeInsets.only(left: 90),
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
                    width: 120,
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
                    "CP DFE Referece",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter CP authorization reference',
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
                    "O/S Reference",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter Ordanance Survey Reference',
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
                    "Private Property",
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
                            value: "yes",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("Yes"),
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
                            value: "no",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("No"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Traffic Lights",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
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
                            value: "survey_req",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("Survey Req"),
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
                            value: "2_way",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("2 Way"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                            value: "3_way",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("3 Way"),
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
                            value: "none",
                            groupValue: value_radio,
                            onChanged: (value) {
                              setState(() {
                                value_radio = value.toString();
                              });
                            },
                          ),
                          Text("None"),
                        ],
                      ),
                    ),
                  ),
                ],
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
                            builder: (context) => A55Form_10(),
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
