import 'package:flutter/material.dart';
import 'package:tic_tac_toe/widgets.dart';

void main() {
  runApp(MaterialApp(
    home: GamePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  List<String> board = List.generate(9, (index) => "");
  String currentPlayer = "x";
  bool gameActive = true;
  int turnCount = 0;

  void handleTap(int index) {
    if (board[index] == "" && gameActive) {
      setState(() {
        board[index] = currentPlayer;
        turnCount++;
        if (checkWinner(board, currentPlayer, turnCount)) {
          gameActive = false;
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  message: "$currentPlayer WINS!",
                ),
              ),
            );
          });
        } else if (turnCount == 9) {
          gameActive = false;
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  message: "Match Draw",
                ),
              ),
            );
          });
        } else {
          currentPlayer = currentPlayer == "x" ? "o" : "x";
        }
      });
    }
  }

  bool checkWinner(List<String> b, String player, int turn) {
    List<List<int>> combos = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combo in combos) {
      if (b[combo[0]] == player &&
          b[combo[1]] == player &&
          b[combo[2]] == player) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Tic Tac Toe"),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double gridSize;
          if (constraints.maxWidth < constraints.maxHeight) {
            gridSize = constraints.maxWidth * 0.9;
          } else {
            gridSize = constraints.maxHeight * 0.6;
          }

          return Center(
            child: SizedBox(
              width: gridSize,
              height: gridSize,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                padding: EdgeInsets.all(10),
                itemBuilder: (context, index) {
                  return  container(currentPlayer,()=> handleTap);




                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String message;

  const ResultScreen({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: TextStyle(
                fontSize: 36,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => GamePage()),
                );
              },
              child: Text("Play Again"),
            ),
          ],
        ),
      ),
    );
  }
}
