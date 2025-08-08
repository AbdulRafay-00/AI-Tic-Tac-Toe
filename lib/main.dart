import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Al_user/Ai_User.dart';
import 'package:tic_tac_flutter/Game_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tic_tac_flutter/Splash_Screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(Head()); // or your actual root widget
}

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.blue,
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          // ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: Splash_Screen(),
      // testing of different widgets
      // home: Ai_opponent()
    );
  }
}
