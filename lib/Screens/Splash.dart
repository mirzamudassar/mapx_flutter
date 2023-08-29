import 'package:flutter/material.dart';
import 'package:mapx/Screens/Intro.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }

  _navigateHome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const Intro()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FullScreenImage(),
    );
  }
}


// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     super.initState();
//     _navigate();
//   }

//   _navigate() async {
//     await Future.delayed(const Duration(milliseconds: 2000));

//     // Check if user details are present in shared preferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = prefs.getString('user_id') ?? ''; // You can choose any key that makes sense

//     if (userId.isNotEmpty) {
//       // User details found, navigate to the dashboard
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
//     } else {
//       // User details not found, navigate to the login screen
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Intro()));
//     }
//   }


class FullScreenImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Image.asset(
        'assets/images/Splash.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
