import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mapx/Modals/Draft.dart';
import 'package:mapx/Screens/Dashboard.dart';
import 'package:mapx/Screens/SideMenu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:motion_toast/motion_toast.dart';


class Network extends StatefulWidget {
  const Network  ({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> with SingleTickerProviderStateMixin {
  
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
            child: const SideMenu(itemSelected: 4),
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
                    child: const NetworkWidgets())),
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
          isMenuBarOpen ? "" : "Network",
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



class NetworkWidgets extends StatefulWidget {
  
  const NetworkWidgets({super.key});

  @override
  State<NetworkWidgets> createState() => _NetworkWidgetsState();
}

class _NetworkWidgetsState extends State<NetworkWidgets> {
  File? _image;
  File? _image2;
  File? _image3;
  File? _image4;

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final String apiUrl = "https://test2.nets-x-map.com/mobileNetworkPost";

  TextEditingController userIdController = TextEditingController();
  TextEditingController siteController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController exchangeController = TextEditingController();
  TextEditingController crfController = TextEditingController();
  TextEditingController orReferenceController = TextEditingController();
  TextEditingController noiController = TextEditingController();
  TextEditingController issue1Controller = TextEditingController();
  TextEditingController cpNameController = TextEditingController();
  TextEditingController idPoleController = TextEditingController();
  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();
  TextEditingController adressController = TextEditingController();
  TextEditingController issue2Controller = TextEditingController();
  TextEditingController issueNoteController = TextEditingController();
  TextEditingController excitingWiresController = TextEditingController();
  TextEditingController forecastWiresController = TextEditingController();
  TextEditingController furnitureIssueController = TextEditingController();
  TextEditingController maxPoleCapacityController = TextEditingController();
  TextEditingController gridReferenceController = TextEditingController();
  TextEditingController thirdIssueController = TextEditingController();
  TextEditingController dpIdController = TextEditingController();


Future<void> _submitForm() async {
   String? image1Base64 = _image != null ? base64Encode(_image!.readAsBytesSync()) : null;
    String? image2Base64 = _image2 != null ? base64Encode(_image2!.readAsBytesSync()) : null;
    String? image3Base64 = _image3 != null ? base64Encode(_image3!.readAsBytesSync()) : null;
    String? image4Base64 = _image4 != null ? base64Encode(_image4!.readAsBytesSync()) : null;

    
      // Create the request body based on your data
      Map<String, dynamic> requestData = {
         "user_id": userIdController.text,
        "site": siteController.text,
        "area": areaController.text,
        "lat": latitudeController.text,
        "lng": longitudeController.text,
        "exchange": exchangeController.text,
        "crf": crfController.text,
        "or_reference": orReferenceController.text,
        "noi": noiController.text,
        "issue": issue1Controller.text,
        "cp_name": cpNameController.text,
        "dp_id": dpIdController.text,
        "secondIssue": issue2Controller.text,
        "issue_note": issueNoteController.text,
        "exciting_wires": excitingWiresController.text,
        "forcost_wires": forecastWiresController.text,
        "furniture_issue": furnitureIssueController.text,
        "max_pole_capacity": maxPoleCapacityController.text,
        "third_issue": thirdIssueController.text,
        "pic_one": image1Base64,
      "picTwo": image2Base64,
      "picThird": image3Base64,
      "picFourth": image4Base64,
        
      };

      try {
        final response = await http.post(
          Uri.parse(apiUrl),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(requestData),
        );

        if (response.statusCode == 200) {
          // Handle successful response
          // print("Form submitted successfully");
          MotionToast.success(
                                title: Text("Success"),
                                description: Text(response.body))
                            .show(context);

        } else {
          MotionToast.error(
                                title: Text("Error"),
                                description: Text(response.body))
                            .show(context);
          // Handle error response
          // print("Error submitting form: ${response.body}");
        }
      } catch (e) {
        print("Error: $e");
      }
    
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
   Future<void> _pickImage2(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage( source: ImageSource.gallery, maxWidth: 180,
      maxHeight: 180);
    if (pickedImage != null) {
      setState(() {
        _image2 = File(pickedImage.path);
      });
    }
  }
   Future<void> _pickImage3(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage( source: ImageSource.gallery, maxWidth: 180,
      maxHeight: 180);
    if (pickedImage != null) {
      setState(() {
        _image3 = File(pickedImage.path);
      });
    }
  }
    Future<void> _pickImage4(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage( source: ImageSource.gallery, maxWidth: 180,
      maxHeight: 180);
    if (pickedImage != null) {
      setState(() {
        _image4 = File(pickedImage.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 150),
            RoundedTextField(
                label: "User Id", hintText: "Enter your Answer"),
              SizedBox(height: 35),
            RoundedTextField(
              label: "Site", hintText: "Enter your Answer"),
              SizedBox(height: 35),
            RoundedTextField(
                label: "Area", hintText: "Enter your Answer"),
            SizedBox(height:35),
            RoundedTextField(label: "Exchange", hintText: "Enter exchange name"),
            SizedBox(height: 35),
            RoundedTextField(label: "CRF", hintText: "Enter CRF"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "OR Reference", hintText: "Enter OR Reference"),
            SizedBox(height: 35),
            RoundedTextField(label: "NOI", hintText: "Enter NOI"),
            SizedBox(height: 35),
            RoundedTextField(label: "Issue1", hintText: "Enter Issue"),
           
            SizedBox(height: 35),
            RoundedTextField(label: "CP Name", hintText: "Enter CP name"),
            SizedBox(height: 35),
            RoundedTextField(label: "ID Pole", hintText: "Enter Id Pole"),
     
            SizedBox(height: 35),
            RoundedTextField(label: "Latitude", hintText: "Enter Latitude"),
            SizedBox(height: 35),
            RoundedTextField(label: "Longitude", hintText: "Enter Longitude"),
            SizedBox(height: 35),
            RoundedTextField(label: "Adress", hintText: "Enter your Adress"),
            SizedBox(height: 35),
            RoundedTextField(label: "DP Id", hintText: "Enter Dp Id"),
            SizedBox(height: 35),
            RoundedTextField(label: "Second Issue", hintText: "Enter issue"),
            SizedBox(height: 35),
            RoundedTextField(label: "Issue Note", hintText: "Enter Issue Note"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "Exciting Wires", hintText: "Enter your Answer"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "Forecast Wires", hintText: "Enter your Answer"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "Furniture Issue", hintText: "Enter your Answer"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "Maximun Pole Capacity", hintText: "Enter your Answer"),
            SizedBox(height: 35),
            RoundedTextField(
                label: "Grid Reference", hintText: "Enter your Answer"),    
            SizedBox(height: 35),
       
            RoundedTextField(
                label: "Third Issue", hintText: "Enter your Answer"),
           SizedBox(height: 20),
            Text("Picture1",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 10), // Add some space below the "Picture" text
            Container(
              width: 250, // Adjust the width of the box
              height: 150, // Adjust the height of the box
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF3D9F46),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                     _pickImage(ImageSource.gallery);
                  },
                ),
              ),
            ),SizedBox(height: 15),
            Text("Picture2",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 10), // Add some space below the "Picture" text
            Container(
              width: 250, // Adjust the width of the box
              height: 150, // Adjust the height of the box
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF3D9F46),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                     _pickImage2(ImageSource.gallery);
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Text("Picture3",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 10), // Add some space below the "Picture" text
            Container(
              width: 250, // Adjust the width of the box
              height: 150, // Adjust the height of the box
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF3D9F46),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                     _pickImage3(ImageSource.gallery);
                  },
                ),
              ),
            ),
            SizedBox(height: 15),
            Text("Picture4",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            SizedBox(height: 10), // Add some space below the "Picture" text
            Container(
              width: 250, // Adjust the width of the box
              height: 150, // Adjust the height of the box
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF3D9F46),
                  style: BorderStyle.solid,
                  width: 1,
                ),
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.upload_file),
                  onPressed: () {
                     _pickImage4(ImageSource.gallery);
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle the Next button press
                     Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Dashboard(),
                        ),
                      );
                   
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffffffff), // Set the background color here
                  ),
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF6EB544),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {

                    _submitForm();
                    // Handle the Next button press
                    // You can navigate to the next screen or perform an action here
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF6EB544), // Set the background color here
                  ),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
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

class RoundedTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData? icon;

  RoundedTextField({required this.label, required this.hintText, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFC0D4AC)),
          ),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Color.fromARGB(255, 41, 41, 41),
              ),
              contentPadding: EdgeInsets.all(10),
              border: InputBorder.none,
              suffixIcon: icon != null ? Icon(icon) : null,
            ),
          ),
        ),
      ],
    );
  }
}

class RoundedDateField extends StatefulWidget {
  final String label;
  final String hintText;

  RoundedDateField({required this.label, required this.hintText});

  @override
  _RoundedDateFieldState createState() => _RoundedDateFieldState();
}

class _RoundedDateFieldState extends State<RoundedDateField> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label),
        SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFC0D4AC)),
          ),
          child: InkWell(
            onTap: () async {
              final DateTime? picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (picked != null && picked != selectedDate) {
                setState(() {
                  selectedDate = picked;
                });
              }
            },
            child: InputDecorator(
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.all(10),
                border: InputBorder.none,
                suffixIcon: Icon(Icons.calendar_today), // Add the icon here
              ),
              child: Text(
                selectedDate != null
                    ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                    : '',
                style: TextStyle(
                  fontWeight: FontWeight.w100,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

