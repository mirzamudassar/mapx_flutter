import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapx/Screens/SideMenu.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({super.key});

  @override
  State<NetworkScreen> createState() => _NetworkScreenState();
}

class _NetworkScreenState extends State<NetworkScreen>
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
            child: const SideMenu(
              itemSelected: 0,
            ),
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
                    child: const NetworkWidget())),
          ),
          Positioned(
            top: 10,
            left: isMenuBarOpen ? 220 : 10,
            child: SafeArea(
              child: Transform.translate(
                offset: const Offset(20, 0),
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

class NetworkWidget extends StatelessWidget {
  const NetworkWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
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
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}


















// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // Import this for date formatting


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Form Example'),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 32),
//               HeaderSection(),
//               SizedBox(height: 16),
//               MyForm(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class HeaderSection extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               width: 231,
//               height: 2,
//               decoration: BoxDecoration(
//                 color: Color(0xFFBEC5BE),
//               ),
//             ),
//             Container(
//               width: 120,
//               height: 2,
//               decoration: BoxDecoration(
//                 color: Color(0xFF3D9F46),
//               ),
//             ),
//             Container(
//               width: 5.008691310882568,
//               height: 7.095645427703857,
//               // Add your other containers and shapes here
//             ),
//           ],
//         ),
//         SizedBox(height: 8), // Add space between lines and text
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(
//                   right: 109), // Add left padding to "Exchange" text
//               child: Text(
//                 "Exchange",
//                 style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w300,
//                   color: Color(0xFF3D9F46),
//                 ),
//               ),
//             ),
//             Text(
//               "Issues",
//               style: TextStyle(
//                   fontSize: 10,
//                   fontWeight: FontWeight.w100,
//                   color: Colors.grey),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

// class MyForm extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           RoundedTextField(label: "Exchange", hintText: "Enter exchange name"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "CRF", hintText: "Enter CRF"),
//           SizedBox(height: 35),
//           RoundedTextField(
//               label: "OR Reference", hintText: "Enter OR Reference"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "NOI", hintText: "Enter NOI"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Issue", hintText: "Enter Issue"),
//           SizedBox(height: 35),
//           RoundedDateField(label: "Date", hintText: "Enter date"),

//           SizedBox(height: 35),
//           RoundedTextField(label: "CP Name", hintText: "Enter CP name"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "ID Pole", hintText: "Enter Id Pole"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Post Code", hintText: "Enter Post Code"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Latitude", hintText: "Enter Latitude"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Longitude", hintText: "Enter Longitude"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Adress", hintText: "Enter your Adress"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "DP Id", hintText: "Enter Dp Id"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Issue", hintText: "Enter issue"),
//           SizedBox(height: 35),
//           RoundedTextField(label: "Issue Note", hintText: "Enter Issue Note"),
//           SizedBox(height: 35),
//           RoundedTextField(
//               label: "Exciting Wires", hintText: "Enter your Answer"),
//           SizedBox(height: 35),
//           RoundedTextField(
//               label: "Forecast Wires", hintText: "Enter your Answer"),
//           SizedBox(height: 35),
//           RoundedTextField(
//               label: "Furniture Issue", hintText: "Enter your Answer"),
//           SizedBox(height: 35),
//           RoundedTextField(
//               label: "Maximun Pole Capacity", hintText: "Enter your Answer"),
//           SizedBox(height: 35),
//           Text("Picture",
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w400,
//               )),
//           SizedBox(height: 10), // Add some space below the "Picture" text
//           Container(
//             width: 250, // Adjust the width of the box
//             height: 150, // Adjust the height of the box
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Color(0xFF3D9F46),
//                 style: BorderStyle.solid,
//                 width: 1,
//               ),
//             ),
//             child: Center(
//               child: IconButton(
//                 icon: Icon(Icons.upload_file),
//                 onPressed: () {
//                   print("Upload image pressed");
//                 },
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment:
//                 MainAxisAlignment.spaceEvenly, // Adjust alignment as needed
//             children: [
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle the Next button press
//                   // You can navigate to the next screen or perform an action here
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xffffffff), // Set the background color here
//                 ),
//                 child: Text(
//                   "Cancel",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: Color(0xFF6EB544),
//                   ),
//                 ),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle the Next button press
//                   // You can navigate to the next screen or perform an action here
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Color(0xFF6EB544), // Set the background color here
//                 ),
//                 child: Text(
//                   "Next",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RoundedTextField extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final IconData? icon;

//   RoundedTextField({required this.label, required this.hintText, this.icon});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         SizedBox(height: 4),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Color(0xFFC0D4AC)),
//           ),
//           child: TextFormField(
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: TextStyle(
//                 fontWeight: FontWeight.w100,
//                 fontSize: 14,
//                 color: Colors.grey,
//               ),
//               contentPadding: EdgeInsets.all(10),
//               border: InputBorder.none,
//               suffixIcon: icon != null ? Icon(icon) : null,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RoundedDateField extends StatefulWidget {
//   final String label;
//   final String hintText;

//   RoundedDateField({required this.label, required this.hintText});

//   @override
//   _RoundedDateFieldState createState() => _RoundedDateFieldState();
// }

// class _RoundedDateFieldState extends State<RoundedDateField> {
//   DateTime? selectedDate;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(widget.label),
//         SizedBox(height: 4),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Color(0xFFC0D4AC)),
//           ),
//           child: InkWell(
//             onTap: () async {
//               final DateTime? picked = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2101),
//               );
//               if (picked != null && picked != selectedDate) {
//                 setState(() {
//                   selectedDate = picked;
//                 });
//               }
//             },
//             child: InputDecorator(
//               decoration: InputDecoration(
//                 hintText: widget.hintText,
//                 hintStyle: TextStyle(
//                   fontWeight: FontWeight.w100,
//                   fontSize: 14,
//                   color: Colors.grey,
//                 ),
//                 contentPadding: EdgeInsets.all(10),
//                 border: InputBorder.none,
//                 suffixIcon: Icon(Icons.calendar_today), // Add the icon here
//               ),
//               child: Text(
//                 selectedDate != null
//                     ? DateFormat('yyyy-MM-dd').format(selectedDate!)
//                     : '',
//                 style: TextStyle(
//                   fontWeight: FontWeight.w100,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
