import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game_page.dart';
class Winning_Condition_check extends StatelessWidget {
   Winning_Condition_check({this.final_message=""});
String final_message;
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(final_message,style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,backgroundColor: Colors.lightGreenAccent),),
            SizedBox( height: 9,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Game_page()));
            }, child: Text("Next Round"),

            ),

          ],
        ),
      ),
    );
  }
}
