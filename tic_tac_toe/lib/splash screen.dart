import "dart:async";

import "package:firebase_auth/firebase_auth.dart";
import"package:flutter/material.dart";
import "package:tic_tac_toe/Test.dart";
import "package:tic_tac_toe/game_page.dart";
import "package:tic_tac_toe/login_page.dart";

void main(){
  runApp( Splash_Screen());
}

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   Direction();
  }
  void Direction(){
  FirebaseAuth auth = FirebaseAuth.instance;
  final user = auth.currentUser;
    if (user == null ){
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_Page()));
      });
    }else{
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Game_page()));
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title:Text("Welcome!",style: TextStyle(fontSize: 25,color: Colors.black),) ,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            // Text("THERE CAN ONLY BE ONE WINNER ",style: TextStyle(color: Colors.black,fontSize:20,fontWeight:FontWeight.bold),),
            // Text("LETS G0!",style: TextStyle(color: Colors.black,fontSize:20,fontWeight:FontWeight.bold),),
          ],
        )
      ),
    );
  }
}
