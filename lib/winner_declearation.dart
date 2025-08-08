import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Al_user/Ai_User.dart';
import 'package:tic_tac_flutter/Game_page.dart';
import 'package:tic_tac_flutter/widgets.dart';

// To Store Data From Previous Page
List Winner_Store = [];

class Winner_Declearation extends StatelessWidget {
  Winner_Declearation({this.final_message, this.mode});
  bool? mode;
  String? final_message;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height * 0.5;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "RESULT PAGE",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: screenHeight,
            child: Result_Container(final_message!, mode!),
          ),
          SizedBox(height: 20),
          Text(
            final_message!,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.lightGreenAccent,
            ),
          ),
          SizedBox(height: 9),
          ElevatedButton(
            onPressed: () {
              if (mode!) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Game_page()),
                );
              } else {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Ai_opponent()),
                );
              }
            },
            child: Text("Next Round"),
          ),
        ],
      ),
    );
  }
}
