import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Al_user/Ai_User.dart';
import 'package:tic_tac_flutter/Game_page.dart';
import 'package:tic_tac_flutter/Login_Page.dart';

class Mode_Selection extends StatelessWidget {
  const Mode_Selection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Your Mode",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Login_Page()),
                    );
                  },
                  child: Icon(
                    Icons.logout_outlined,
                    size: 25,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Log Out",
                  style: TextStyle(fontSize: 13, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Game_page()),
                  );
                },
                child: Text(
                  "Two Players",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 8),

              Text("OR", style: Theme.of(context).textTheme.headlineLarge),
              SizedBox(height: 8),

              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Ai_opponent()),
                  );
                },
                child: Text(
                  "Play With AI",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
