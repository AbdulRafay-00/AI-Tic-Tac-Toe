
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tic_tac_flutter/Widget_For_Ai.dart';
import 'package:tic_tac_flutter/widgets.dart';
import 'package:tic_tac_flutter/winner_declearation.dart'; // custom container widget

class Ai_opponent extends StatefulWidget {
  const Ai_opponent({super.key});

  @override
  State<Ai_opponent> createState() => _Ai_opponentState();
}

class _Ai_opponentState extends State<Ai_opponent> {
  List board = List.generate(9, (index) => "");
  String Symbol = "x";
  bool turns = true;
  MatchesCount count = MatchesCount();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Defeat The System"),
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
                        count.AIMatchCount(reset_Length: true);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Ai_opponent(),
                          ),
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
              "Match No: ${count.AIMatchCount()}",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(height: 6),
            LayoutBuilder(
              builder: (context, container) {
                double gridSize = container.maxWidth < container.maxHeight
                    ? container.maxWidth * 0.9
                    : container.maxWidth * 0.6;

                return Center(
                  child: SizedBox(
                    height: gridSize,
                    width: gridSize,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: 9,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                      itemBuilder: (context, index) {
                        return containers(
                          board[index],
                          () => onhandel(index),
                          turns,
                        );
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

  void onhandel(int index) {
    if (board[index] == "" && turns) {
      setState(() {
        board[index] = "x";
        Symbol = "o";
        turns = false;
      });

      int result = IsWinning(board);
      if (result == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Winner_Declearation(final_message: "Human Wins", mode: false),
          ),
        );
        print("You win!");
        return;
      } else if (result == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Winner_Declearation(final_message: "Draw", mode: false),
          ),
        );
        print("Draw!");
        return;
      }

      Future.delayed(const Duration(milliseconds: 300), () {
        Ai_turn();
        int aiResult = IsWinning(board);
        if (aiResult == -1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Winner_Declearation(final_message: "AI Wins", mode: false),
            ),
          );
          print("AI wins!");
        } else if (aiResult == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  Winner_Declearation(final_message: "Draw", mode: false),
            ),
          );

          print("Draw!");
        }
      });
    }
  }

  void Ai_turn() {
    int bestScore = -1000;
    int bestMove = -1;

    for (int i = 0; i < 9; i++) {
      if (board[i] == "") {
        board[i] = "o";
        int score = minimax(false, 0);
        board[i] = "";
        if (score > bestScore) {
          bestScore = score;
          bestMove = i;
        }
      }
    }

    if (bestMove != -1) {
      setState(() {
        board[bestMove] = "o";
        Symbol = "x";
        turns = true;
      });
    }
  }

  int minimax(bool isMaximizing, int depth) {
    int result = IsWinning(board);
    if (result != 2) {
      if (result == -1) return 1; // AI wins
      if (result == 1) return -1; // Player wins
      return 0; // Draw
    }

    if (isMaximizing) {
      int bestScore = -1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == "") {
          board[i] = "o";
          int score = minimax(false, depth + 1);
          board[i] = "";
          bestScore = max(score, bestScore);
        }
      }
      return bestScore;
    } else {
      int bestScore = 1000;
      for (int i = 0; i < 9; i++) {
        if (board[i] == "") {
          board[i] = "x";
          int score = minimax(true, depth + 1);
          board[i] = "";
          bestScore = min(score, bestScore);
        }
      }
      return bestScore;
    }
  }

  int IsWinning(List b) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      String a = b[pattern[0]];
      String bb = b[pattern[1]];
      String c = b[pattern[2]];
      if (a != "" && a == bb && bb == c) {
        if (a == "x") return 1;
        if (a == "o") return -1;
      }
    }

    if (!b.contains("")) {
      return 0; // Draw
    }

    return 2; // Game ongoing
  }
}
