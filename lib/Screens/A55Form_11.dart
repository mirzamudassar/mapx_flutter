import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapx/Modals/Draft.dart';

import 'package:mapx/Screens/A55Form_10.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:mapx/Screens/SideMenu.dart';



class A55_11Page extends StatefulWidget {
  const A55_11Page ({super.key});

  @override
  State<A55_11Page> createState() => _A55_11PageState();
}

class _A55_11PageState extends State<A55_11Page> with SingleTickerProviderStateMixin {
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
                    child: const A55_11PageWidgets())),
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





// A55_11PageWidgets 
class A55_11PageWidgets extends StatefulWidget {
  const A55_11PageWidgets ({super.key});
  @override
  _A55_11PageWidgetsState createState() => _A55_11PageWidgetsState();
}

class _A55_11PageWidgetsState extends State<A55_11PageWidgets> {
  File? _image;
  File? _image2;

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
  //  Future<void> _pickImage_camera(ImageSource source) async {
  //   final pickedImage = await ImagePicker().pickImage( source: ImageSource.camera, maxWidth: 180,
  //     maxHeight: 180);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _image = File(pickedImage.path);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Image Upload and Display")),
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
                      padding: const EdgeInsets.only(left: 280),
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
                            color: Color(0xFF3D9F46),
                          ),
                        ),
                        SizedBox(width: 40), // Default space between lines
                        Text(
                          'Images',
                          style: TextStyle(fontSize: 10, color: Color(0xFF3D9F46),),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 70),
                 _image != null ? Image.file(_image!) : SizedBox.shrink(),
                Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for the "Add Chamber" button
                  _pickImage(ImageSource.gallery);
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
              SizedBox(height:70),
               _image2 != null ? Image.file(_image2!) : SizedBox.shrink(),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Logic for the "Add Chamber" button
                    _pickImage2(ImageSource.gallery);
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
              SizedBox(height: 150),
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
                            builder: (context) => A55_10Page(),
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
                      onPressed: () {
                        
                       
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
       
          ]),
          ],
             ),
       ),
    );
  }
}
