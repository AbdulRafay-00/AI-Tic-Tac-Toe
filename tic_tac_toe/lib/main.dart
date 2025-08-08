import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_page.dart';
import 'package:tic_tac_toe/login_page.dart';
import 'package:tic_tac_toe/splash%20screen.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Head());
}

class Head extends StatefulWidget {
  const Head({super.key});

  @override
  State<Head> createState() => _HeadState();
}

class _HeadState extends State<Head> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(

      theme:ThemeData(
        primaryColor: Colors.blue,
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)
        ),),
      home:Game_page()
      // home: Login_Page()
    );
  }
}
//    ndkVersion = flutter.ndkVersion
// minSdk = flutter.minSdkVersion