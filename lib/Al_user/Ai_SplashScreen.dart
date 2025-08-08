import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Al_user/Ai_User.dart';
import 'package:tic_tac_flutter/Game_page.dart';

class Ai_Splash_Screen extends StatefulWidget {
  Ai_Splash_Screen({super.key});

  @override
  State<Ai_Splash_Screen> createState() => _Ai_Splash_ScreenState();
}

class _Ai_Splash_ScreenState extends State<Ai_Splash_Screen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Game_page()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
