import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:mapx/Database/MapXDB.dart';
import 'package:mapx/Screens/A55Form_11.dart';
import 'package:mapx/Screens/Login.dart';
import 'package:mapx/Screens/Splash.dart';
import 'package:mapx/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  print("Creating databases");
  final mapxdb = MapXDB();
  mapxdb.createTable();
  print("Database created");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            Colors.white, // Set the background color to white
        colorScheme: const ColorScheme.light(), // Use default color scheme
        textTheme: const TextTheme(bodyLarge: TextStyle(fontFamily: "Inter")),
      ),
      home: const A55_11Page(),
      // home: const DraftPage(),
    );
  }
}
