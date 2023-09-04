import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapx/Modals/Draft.dart';

import 'package:mapx/Screens/A55Form_8.dart';
import 'package:mapx/Screens/A55Form_10.dart';
import 'package:http/http.dart' as http;
import 'package:mapx/Screens/SideMenu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class A55_9Page extends StatefulWidget {
  final String area;
  final String site;
  final String chamberid;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String imagePath4;
  final String selectedTypeValue;
  final String chamberid2;
  final String twoimagePath1;
  final String twoimagePath2;
  final String twoimagePath3;
  final String twoimagePath4;
  final String selectedTypeValue2;
  final String L1;
  final String L2;
  final String L3;
  final String cluster;
  final String exchange;
  final String pia;
  final String onsite;
  final String telephone;
  final String radiowork;

  const A55_9Page({
    Key? key,
    required this.area,
    required this.site,
    required this.chamberid,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.imagePath4,
    required this.selectedTypeValue,
    required this.chamberid2,
    required this.twoimagePath1,
    required this.twoimagePath2,
    required this.twoimagePath3,
    required this.twoimagePath4,
    required this.selectedTypeValue2,
    required this.L1,
    required this.L2,
    required this.L3,
    required this.cluster,
    required this.exchange,
    required this.pia,
    required this.onsite,
    required this.telephone,
    required this.radiowork,
  }) : super(key: key);

  @override
  State<A55_9Page> createState() => _A55_9PageState();
}

class _A55_9PageState extends State<A55_9Page>
    with SingleTickerProviderStateMixin {
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
                    child: A55_9PageWidgets(
                      area: widget.area,
                      site: widget.site,
                      chamberid: widget.chamberid,
                      imagePath: widget.imagePath,
                      imagePath2: widget.imagePath2,
                      imagePath3: widget.imagePath3,
                      imagePath4: widget.imagePath4,
                      selectedTypeValue: widget.selectedTypeValue,
                      chamberid2: widget.chamberid2,
                      twoimagePath1: widget.twoimagePath1,
                      twoimagePath2: widget.twoimagePath2,
                      twoimagePath3: widget.twoimagePath3,
                      twoimagePath4: widget.twoimagePath4,
                      selectedTypeValue2: widget.selectedTypeValue2,
                      L1: widget.L1,
                      L2: widget.L2,
                      L3: widget.L3,
                      cluster: widget.cluster,
                      exchange: widget.exchange,
                      pia: widget.pia,
                      onsite: widget.onsite,
                      telephone: widget.telephone,
                      radiowork: widget.radiowork,
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

class A55_9PageWidgets extends StatefulWidget {
  final String area;
  final String site;
  final String chamberid;
  final String imagePath;
  final String imagePath2;
  final String imagePath3;
  final String imagePath4;
  final String selectedTypeValue;
  final String chamberid2;
  final String twoimagePath1;
  final String twoimagePath2;
  final String twoimagePath3;
  final String twoimagePath4;
  final String selectedTypeValue2;
  final String L1;
  final String L2;
  final String L3;
  final String cluster;
  final String exchange;
  final String pia;
  final String onsite;
  final String telephone;
  final String radiowork;

  const A55_9PageWidgets({
    Key? key,
     required this.area,
    required this.site,
    required this.chamberid,
    required this.imagePath,
    required this.imagePath2,
    required this.imagePath3,
    required this.imagePath4,
    required this.selectedTypeValue,
    required this.chamberid2,
    required this.twoimagePath1,
    required this.twoimagePath2,
    required this.twoimagePath3,
    required this.twoimagePath4,
    required this.selectedTypeValue2,
    required this.L1,
    required this.L2,
    required this.L3,
    required this.cluster,
    required this.exchange,
    required this.pia,
    required this.onsite,
    required this.telephone,
    required this.radiowork,
  }) : super(key: key);

  @override
  State<A55_9PageWidgets> createState() => _A55_9PageWidgetsState();
}

class _A55_9PageWidgetsState extends State<A55_9PageWidgets> {
  String? Propertyvalue;
  String? Percentagevalue;
  String? Trafficevalue;
  String? Ductvalue;
  String? value_radio;

  Future<void> sendFormData(
    String area,
    String site,
    String chamber1_id,
     String imagePath, String imagePath2, String imagePath3, String imagePath4,
    String selectedType,
    String chamber2_id,
       String twoimagePath1, String twoimagePath2, String twoimagePath3, String twoimagePath4,
    String selectedType2,
    String L1,
    String L2,
    String L3,
    String Telephone,
    String Onsite,
    String Exchange,
    String Cluster,
    String Pia,
    String Workvalue,
    String Cp,
    String Os,
    String Ductno,
    String Nocables,
    String Proposedcables,
    String Ductdiameter,
    String? Propertyvalue,
  String? Percentagevalue,
    String? Trafficvalue,
    String? Ductvalue,
  ) async {
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
      'chamber2': chamber2_id,
       "chamber2_1": twoimagePath1,  // Replace with actual image data
    "chamber2_2":  twoimagePath2,  // Replace with actual image data
    "chamber2_3":  twoimagePath3,  // Replace with actual image data
    "chamber2_4":  twoimagePath4 ,
      'selectedType2': selectedType2,
      'l1_soft': L1,
      'l2_soft': L2,
      'l3_soft': L3,
      'area': Cluster,
      'exchange': Exchange,
      'onsite_eng': Onsite,
      'telephone_no': Telephone,
      'pia_order_no': Pia,
      'work_required': Workvalue,
      'cp_def_ref': Cp,
      'os_ref': Os,
      'duct_section_no': Ductno,
      'no_of_cables_in_bore': Nocables,
      'proposed_cable': Proposedcables,
      'proposed_sub_duct_diameter': Ductdiameter,
      'private_property': Propertyvalue,
      'percentage_bore_full': Percentagevalue,
      'traffic_light': Trafficvalue,
      'duct_type': Ductvalue,
    }); // Use jsonEncode to format the body

    final response =
        await http.post(Uri.parse(apiUrl), headers: headers, body: body);

    if (response.statusCode == 200) {
      // Data successfully sent to the server
      print("Data submitted successfully!");
    } else {
      // Handle error
      print("Error submitting data. Status code: ${response.statusCode}");
      print("Response body: ${response.body}");
    }
  }

  final TextEditingController _cpController = TextEditingController();
  final TextEditingController _osController = TextEditingController();
  final TextEditingController _ductnoController = TextEditingController();
  final TextEditingController _nocablesController = TextEditingController();
  final TextEditingController _proposedController = TextEditingController();
  final TextEditingController _ductdiameterController = TextEditingController();

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
    String chamberid2 = widget.chamberid2;
    String twoimagePath1 = widget.twoimagePath1;
    String twoimagePath2 = widget.twoimagePath2;
    String twoimagePath3 = widget.twoimagePath3;
    String twoimagePath4 = widget.twoimagePath4;
    String selectedTypeValue2 = widget.selectedTypeValue2;
    String L1 = widget.L1;
    String L2 = widget.L2;
    String L3 = widget.L3;
    String cluster = widget.cluster;
    String exchange = widget.exchange;
    String pia = widget.pia;
    String onsite = widget.onsite;
    String telephone = widget.telephone;
    String work = widget.radiowork;
    String cp = _cpController.text;
    String os = _osController.text;
    String ductno = _ductnoController.text;
    String nocables = _nocablesController.text;
    String proposedcable = _proposedController.text;
    String ductdiameter = _ductdiameterController.text;


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 120),
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
                    controller: _cpController,
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
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _osController,
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
                      "Duct Secton No",
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
                    controller: _ductnoController,
                    decoration: InputDecoration(
                      labelText: 'Enter Duct Section Number',
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
                      "No of cables",
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
                    controller: _nocablesController,
                    decoration: InputDecoration(
                      labelText: 'No of Cables in Bore',
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
                      "Proposed Cable",
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
                    controller: _proposedController,
                    decoration: InputDecoration(
                      labelText: 'Proposed Cable',
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
                      "Duct Diameter",
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
                    controller: _ductdiameterController,
                    decoration: InputDecoration(
                      labelText: 'Proposed sub Duct Diameter',
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
                SizedBox(height: 20),
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
                              groupValue: Propertyvalue,
                              onChanged: (value) {
                                setState(() {
                                  Propertyvalue= value.toString();
                                   print("$Propertyvalue");
                                });
                                 if (value == "yes") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                  area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }


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
                              groupValue: Propertyvalue,
                              onChanged: (value) {
                                setState(() {
                                  Propertyvalue= value.toString();
                                  print("$Propertyvalue");
                                });
                                   if (value == "no") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }
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
                      "Percentage bore Full",
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
                              value: "0-50%",
                              groupValue: Percentagevalue,
                              onChanged: (value) {
                                setState(() {
                                  Percentagevalue = value.toString();
                                });
                                  if (value == "0-50%") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("0-50%"),
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
                              value: "51%-75%",
                              groupValue: Percentagevalue,
                              onChanged: (value) {
                                setState(() {
                                  Percentagevalue = value.toString();
                                });
                                  if (value == "51%-75%") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("51%-75%"),
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
                              value: "75%-90%",
                              groupValue: Percentagevalue,
                              onChanged: (value) {
                                setState(() {
                                  Percentagevalue= value.toString();
                                });
                                  if (value == "75%-90%") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("75%-90%"),
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
                              value: "91%-100%",
                              groupValue: Percentagevalue,
                              onChanged: (value) {
                                setState(() {
                                  Percentagevalue= value.toString();
                                });
                                  if (value == "91%-100%") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("91%-100%"),
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
                              groupValue: Trafficevalue,
                              onChanged: (value) {
                                setState(() {
                                  Trafficevalue= value.toString();
                                });
                                  if (value == "survey_req") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

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
                              groupValue: Trafficevalue,
                              onChanged: (value) {
                                setState(() {
                                  Trafficevalue = value.toString();
                                });
                                  if (value == "2_way") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

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
                              groupValue: Trafficevalue,
                              onChanged: (value) {
                                setState(() {
                                  Trafficevalue= value.toString();
                                });
                                  if (value == "3_way") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

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
                              groupValue: Trafficevalue,
                              onChanged: (value) {
                                setState(() {
                                  Trafficevalue = value.toString();
                                });
                                  if (value == "none") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("None"),
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
                      "Duct Type",
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
                              value: "pvc",
                              groupValue: Ductvalue,
                              onChanged: (value) {
                                setState(() {
                                  Ductvalue= value.toString();
                                });
                                  if (value == "pvc") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("PVC"),
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
                              value: "steel",
                              groupValue: Ductvalue,
                              onChanged: (value) {
                                setState(() {
                                  Ductvalue = value.toString();
                                });
                                  if (value == "steel") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                            ),
                            Text("Steel"),
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
                              value: "aluminum",
                              groupValue: Ductvalue,
                              onChanged: (value) {
                                setState(() {
                                  Ductvalue = value.toString();
                                });
                                  if (value == "aluminum") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                    area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                              visualDensity: VisualDensity.compact,
                            ),
                            Text("Aluminum"),
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
                              value: "other",
                              groupValue: Ductvalue,
                              onChanged: (value) {
                                setState(() {
                                  Ductvalue= value.toString();
                                });
                                  if (value == "other") {
                                  sendFormData(
                                    // Provide the required parameters for "Ancilliary" here.
                                   area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                                  );
                                }

                              },
                              visualDensity: VisualDensity.compact,
                            ),
                            Text("Other"),
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
                      padding: EdgeInsets.only(
                          right: 20), // Add space between buttons
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your onPressed logic here
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => A55_8Page(
                                site: '',
                                area: '',
                                chamberid: '',
                                imagePath: '',
                                selectedTypeValue: '',
                                chamberid2: '',
                              
                                selectedTypeValue2: '',
                                L1: '',
                                L2: '',
                                L3: '', imagePath2: '', imagePath3: '', imagePath4: '', twoimagePath1: '', twoimagePath2: '', twoimagePath3: '', twoimagePath4: '',
                              ),
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
                      padding: EdgeInsets.only(
                          left: 20), // Add space between buttons
                      child: ElevatedButton(
                        onPressed: ()async {
                          // Navigate to the new screen A55Form_3
                          String cp = _cpController.text;
    String os = _osController.text;
    String ductno = _ductnoController.text;
    String nocables = _nocablesController.text;
    String proposedcable = _proposedController.text;
    String ductdiameter = _ductdiameterController.text;
    print("$cp");
    print("$os");
                          print("$ductno");
                          print("$nocables");
                          print("$proposedcable");
                          print("$ductdiameter");
                          print("$Trafficevalue");
                          print("$Percentagevalue");
                          print("$Propertyvalue");
                          print("$Ductvalue");
                           await sendFormData(
                           area,
                                    site,
                                    chamberid,
                                     imagePath ,
                                     imagePath2,
                                     imagePath3,
                                     imagePath4,
                                    selectedTypeValue,
                                    chamberid2,
                                    twoimagePath1,
                                    twoimagePath2,
                                    twoimagePath3,
                                    twoimagePath4,
                                    selectedTypeValue2,
                                    L1,
                                    L2,
                                    L3,
                                    telephone,
                                    onsite,
                                    exchange,
                                    cluster,
                                    pia,
                                    work,
                                    cp,
                                    os,
                                    ductno,
                                    nocables,
                                    proposedcable,
                                    ductdiameter,
                                    Propertyvalue,
                                    Percentagevalue,
                                    Trafficevalue,
                                    Ductvalue,
                          );
                         
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => A55_10Page(

                                 area: area,
                            site: site,
                            chamberid: chamberid,
                           imagePath: imagePath,
                          imagePath2: imagePath,
                          imagePath3: imagePath,
                          imagePath4: imagePath,
                            selectedTypeValue: selectedTypeValue,
                            chamberid2: chamberid2,
                            twoimagePath1: twoimagePath1,
                            twoimagePath2: twoimagePath2,
                            twoimagePath3: twoimagePath3,
                            twoimagePath4: twoimagePath4,
                            selectedTypeValue2: selectedTypeValue2,
                            L1:L1,
                            L2:L2,
                            L3:L3,
                                cluster: cluster,
                                exchange: exchange,
                                pia: pia,
                                telephone: telephone,
                                onsite: onsite,
                                radiowork: work,  
                                cp:cp,
                                os:os,
                                ductno:ductno,
                                nocables:nocables,
                                proposedcables:proposedcable,
                                ductdiameter:ductdiameter,
                                propertyvalue:Propertyvalue!,
                                percentagevalue:Percentagevalue!,
                                trafficevalue:Trafficevalue!,
                                ductvalue:Ductvalue!,

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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
