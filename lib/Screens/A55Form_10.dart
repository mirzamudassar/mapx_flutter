import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:http/http.dart' as http;
import 'package:mapx/Screens/A55Form_9.dart';
import 'package:mapx/Screens/A55Form_11.dart';

import 'package:mapx/Screens/SideMenu.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:motion_toast/motion_toast.dart';

class A55_10Page extends StatefulWidget {
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

  final String cp;
  final String os;
  final String ductno;
  final String nocables;
  final String proposedcables;
  final String ductdiameter;
  final String propertyvalue;
  final String percentagevalue;
  final String trafficevalue;
  final String ductvalue;

  const A55_10Page({
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
    required this.cp,
    required this.os,
    required this.ductno,
    required this.nocables,
    required this.proposedcables,
    required this.ductdiameter,
    required this.propertyvalue,
    required this.percentagevalue,
    required this.trafficevalue,
    required this.ductvalue,
  }) : super(key: key);

  @override
  State<A55_10Page> createState() => _A55_10PageState();
}

class _A55_10PageState extends State<A55_10Page>
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
                    child: A55_10PageWidgets(
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
                      cp: widget.cp,
                      os: widget.os,
                      ductno: widget.ductno,
                      nocables: widget.nocables,
                      proposedcables: widget.proposedcables,
                      ductdiameter: widget.ductdiameter,
                      propertyvalue: widget.propertyvalue,
                      percentagevalue: widget.percentagevalue,
                      trafficevalue: widget.trafficevalue,
                      ductvalue: widget.ductvalue,
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

class A55_10PageWidgets extends StatefulWidget {
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
  final String cp;
  final String os;
  final String ductno;
  final String nocables;
  final String proposedcables;
  final String ductdiameter;
  final String propertyvalue;
  final String percentagevalue;
  final String trafficevalue;
  final String ductvalue;

  const A55_10PageWidgets({
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
    required this.cp,
    required this.os,
    required this.ductno,
    required this.nocables,
    required this.proposedcables,
    required this.ductdiameter,
    required this.propertyvalue,
    required this.percentagevalue,
    required this.trafficevalue,
    required this.ductvalue,
  }) : super(key: key);

  @override
  State<A55_10PageWidgets> createState() => _A55_10PageWidgetsState();
}

class _A55_10PageWidgetsState extends State<A55_10PageWidgets> {
  

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
    String Propertyvalue,
  String Percentagevalue,
    String Trafficvalue,
    String Ductvalue,
    String Boxavalue,
    String Boxbvalue,
    String Bore,
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
      'box_A_type': Boxavalue,
      'box_B_type': Boxbvalue,
      'bore': Bore,
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

final _formKey = GlobalKey<FormState>(); // Define a form key
  final TextEditingController _boxaController = TextEditingController();
  final TextEditingController _boxbController = TextEditingController();
  final TextEditingController _boreController = TextEditingController();

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
    String cp = widget.cp;
    String os =widget.os;
    String ductno = widget.ductno;
    String nocables = widget.nocables;
    String proposedcable = widget.proposedcables;
    String ductdiameter = widget.ductdiameter;
    String propertyvalue= widget.propertyvalue;
    String percentagevalue = widget.percentagevalue;
    String trafficevalue = widget.trafficevalue;
    String ductvalue= widget.ductvalue;
    String boxa = _boxaController.text;
    String boxb = _boxbController.text;
    String bore = _boreController.text;
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
           key: _formKey, // Assign the form key
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(height: 120),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 170),
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
                        width: 210,
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
                              color: Color(0xFF3D9F46),
                            ),
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
                        "BOX A - Type",
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
                    child: TextFormField(
                       controller: _boxaController,
                      decoration: InputDecoration(
                        labelText: 'Enter Box A Type',
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
                       validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '*';
                    }
                    return null;
                  },
                    ),
                  ),
        
                  SizedBox(height: 20),
        
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "BOX B - Type",
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
                    child: TextFormField(
                      controller: _boxbController,
                      decoration: InputDecoration(
                        labelText: 'Enter Box B Type',
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
                       validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '*';
                    }
                    return null;
                  },
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bore",
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
                    child: TextFormField(
                      controller: _boreController,
                      decoration: InputDecoration(
                        labelText: 'Insert Box Type',
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
                       validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return '*';
                    }
                    return null;
                  },
                    ),
                  ),
                  SizedBox(height: 250),
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
                                builder: (context) => A55_9Page(
                                  area: '',
                                  site: '',
                                  chamberid: '',
                                  imagePath: '',
                                  selectedTypeValue: '',
                                  chamberid2: '',
        
                                  selectedTypeValue2: '',
                                  L1: '',
                                  L2: '',
                                  L3: '',
                                  cluster: '',
                                  exchange: '',
                                  pia: '',
                                  onsite: '',
                                  telephone: '',
                                  radiowork: '',
                                  imagePath2: '', imagePath3: '', imagePath4: '', twoimagePath1: '', twoimagePath2: '', twoimagePath3: '', twoimagePath4: ''
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
                        padding:
                            EdgeInsets.only(left: 20), // Add space between buttons
                        child: ElevatedButton(
                          onPressed: ()async {
                            
                             if (_formKey.currentState?.validate() ?? false) {
                               String? boxa = _boxaController?.text;
                              String? boxb = _boxbController?.text;
                              String? bore = _boreController?.text;
                            print("$bore");
                            print("$boxa");
                            print("$boxb");
        
                            
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
                                cluster,
                                exchange,
                                pia,
                                telephone,
                                onsite,
                                work,
                                 cp,
                                        os,
                                        ductno,
                                        nocables,
                                        proposedcable,
                                        ductdiameter,
                                        propertyvalue,
                                        percentagevalue,
                                        trafficevalue,
                                        ductvalue,
                                        boxa!,
                                        boxb!,
                                        bore!,
                              );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => A55_11Page(
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
                                    L1: L1,
                                    L2: L2,
                                    L3: L3,
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
                                    propertyvalue:propertyvalue!,
                                    percentagevalue:percentagevalue!,
                                    trafficevalue:trafficevalue!,
                                    ductvalue:ductvalue!,
                                    boxa:boxa,
                                    boxb:boxb,
                                    bore:bore,
        
                                ),
                              ),
                            );
                         
      
                              }else{
                                  MotionToast.error(
                                  title: Text("Missing Fields"),
                                  description: Text("Please fill missing required Fields"))
                              .show(context);
                                
                              }
                            
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
      ),
    );
  }
}
