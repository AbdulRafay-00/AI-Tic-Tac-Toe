import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:tic_tac_flutter/Login_Page.dart";
import "package:tic_tac_flutter/widgets.dart";
import "package:tic_tac_flutter/winner_declearation.dart";

class Game_page extends StatefulWidget {
  Game_page({super.key});
  MatchesCount count = MatchesCount();
  @override
  State<Game_page> createState() => _Game_pageState();
}

class _Game_pageState extends State<Game_page> {
  int turn_count = 0;
  bool condition_breaker = true;
  List board = List.generate(9, (index) => "");

  String symbol2 = "x";
  String symbol = "";

  void onhandel(int index) {
    if (condition_breaker == true) {
      if (board[index] == "") {
        setState(() {
          if (symbol2 == "x") {
            board[index] = symbol2;
            // Win(board);
            symbol = symbol2;

            symbol2 = "o";
            turn_count++;
          } else {
            board[index] = symbol2;
            symbol = symbol2;
            symbol2 = "x";
            turn_count++;
          }
          condition_breaker = Win(
            board,
            turn_count,
            context,
            condition_breaker,
          );
        });
      }
    }
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        centerTitle: true,

        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.count.TwoVTwoCount(reset_Length: true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Game_page()),
                        );
                      });
                    },
                    icon: Icon(Icons.refresh_sharp),
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                  Text(
                    "Reset The Score",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Match No ${widget.count.TwoVTwoCount()}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 8),
            LayoutBuilder(
              builder: (context, Container) {
                double gridsize;
                if (Container.maxWidth < Container.maxHeight) {
                  gridsize = Container.maxWidth * 0.9;
                } else {
                  gridsize = Container.maxWidth * 0.6;
                }
                return Center(
                  child: SizedBox(
                    height: gridsize,
                    width: gridsize,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: 9,
                      padding: EdgeInsets.all(10),
                      itemBuilder: (context, Index) {
                        return container(board[Index], () => onhandel(Index));
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Function That Will Check For Winning And Draw Condition
bool Win(board, turn_count, BuildContext context, condition_breaker) {
  List<List<int>> list = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
    [0, 4, 8], [2, 4, 6], // diagonals
  ];
  for (var combo in list) {
    String str1 = board[combo[0]];
    String str2 = board[combo[1]];
    String str3 = board[combo[2]];
    if (str1 == str2 && str2 == str3 && str1 != "" && str3 != "") {
      // Winning Logic For Player One
      if (str1 == "x" && str3 == "x") {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Winner_Declearation(
                final_message: "PLAYER ONE WON ",
                mode: true,
              ),
            ),
          );
        });
        return false;
      }

      // Logic for player 2
      if (str1 == "o" && str3 == "o") {
        Future.delayed(Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Winner_Declearation(
                final_message: "PLAYER TWO WON",
                mode: true,
              ),
            ),
          );
        });
        return false;
      }
    }
    print(turn_count);
    if (turn_count == 9) {
      print("match draw");
      Future.delayed(Duration(seconds: 1), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Winner_Declearation(final_message: "Draw", mode: true),
          ),
        );
      });
      break;
    }
  }
  return true;
}
