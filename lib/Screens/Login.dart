import 'package:flutter/material.dart';
import 'package:mapx/Screens/Dashboard.dart';
import 'dart:convert'; // Add this import
import 'package:http/http.dart' as http; // Add this import
import 'package:shared_preferences/shared_preferences.dart';  

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = false;
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();

  final TextEditingController _emailController = TextEditingController(); // Add this
  final TextEditingController _passwordController = TextEditingController(); // Add this

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/login.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    focusNode: _emailFocusNode,
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xFF6EB544)),
                      suffixIcon:
                          Icon(Icons.email_outlined, color: Color(0xFF6EB544)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _emailFocusNode.hasFocus
                              ? Color(0xFF6EB544)
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    focusNode: _passwordFocusNode,
                    controller: _passwordController,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Color(0xFF6EB544)),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        child: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: const Color(0xFF6EB544),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: _passwordFocusNode.hasFocus
                              ? Color(0xFF6EB544)
                              : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
        ElevatedButton(
  onPressed: () async {
    // Construct the request payload
    final Map<String, String> requestData = {
      'email': _emailController.text,
      'password': _passwordController.text,
    };

    final Uri uri = Uri.parse('https://test2.nets-x-map.com/mobilelogin');

    try {
      final response = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );


      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Save user preferences using shared_preferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('user_id', responseData['user_id']);
        prefs.setString('user_role', responseData['user_role']);
        prefs.setString('username', responseData['username']);
        
        // Navigate to the dashboard
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()),
        );
      } else {

              // MotionToast.error(
              //                   title: Text("Error"),
              //                   description: Text("Please enter your name"))
              //               .show(context);
        // Handle different response status codes here
        print('Login failed: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during login: $error');
    }
  },
   style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF6EB544),
                    minimumSize: const Size.fromHeight(50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Inter",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
  // ... rest of the button widget code ...
