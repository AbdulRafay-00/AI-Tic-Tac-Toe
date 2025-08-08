import"package:flutter/material.dart";
import "package:tic_tac_toe/widgets.dart";
import "package:tic_tac_toe/winner_declearation.dart";

void main(){
runApp(Game_page());
}

class Game_page extends StatefulWidget {
  const Game_page({super.key});

  @override
  State<Game_page> createState() => _Game_pageState();
}

class _Game_pageState extends State<Game_page> {
  int turn_count=0;
  bool condition_breaker=true;
  List board=List.generate(9, (index)=>"");

  String symbol2="x";
  String symbol="";

  void onhandel(int index ){
   turn_count++;
   print("$condition_breaker in side function");
if(condition_breaker==true) {
  if (board[index] == "") {
    // print(board);

    setState(() {
      if (symbol2 == "x") {
        board[index] = symbol2;
        // Win(board);
        symbol = symbol2;

        symbol2 = "o";
      } else {
        board[index] = symbol2;
        symbol = symbol2;
        symbol2 = "x";
      }
     condition_breaker= Win(board, turn_count, context, condition_breaker);
      print(board);
    });
  }
}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  backgroundColor: Colors.black,
),
      body: LayoutBuilder(builder: (context,Container){
        double gridsize;
        if(Container.maxWidth< Container.maxHeight){
          gridsize=Container.maxWidth*0.9;
        }else{
          gridsize=Container.maxWidth*0.6;
        }
        return Center(
          child: SizedBox(
          height: gridsize,
            width: gridsize,
            child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
            mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
                itemCount: 9,
                padding: EdgeInsets.all(10),
                itemBuilder:(context, Index){
              return container(board[Index],()=> onhandel(Index));
                } ),
          ),
        );
      }),
    );

  }
}

// Function That Will Check For Winning And Draw Condition
bool Win(board, turn_count, BuildContext context, condition_breaker){
  List<List<int>> list = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], // rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], // columns
    [0, 4, 8], [2, 4, 6]             // diagonals
  ];
  print("in Wiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiin");
  for(var combo in list){
    String str1 =board[combo[0]];
    String str2 =board[combo[1]];
    String str3 =board[combo[2]];
    if(str1 == str2 && str2 == str3 && str1!="" && str3!= "" ){
// Winning Logic For Player One
      if(str1=="x" && str3 == "x"){
        Future.delayed(Duration(seconds: 1),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Winning_Condition_check(final_message: "PLAYER ONE WON ",)));
        });
        return false;
      }

// Logic for player 2
      if(str1=="o" && str3 == "o"){
        Future.delayed(Duration(seconds: 1),(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Winning_Condition_check(final_message: "PLAYER TWO WON",)));
        });
        return false;
      }

    }
    if(turn_count==9){
     print("match draw");
     Future.delayed(Duration(seconds: 1),(){

     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Winning_Condition_check(final_message: "Match Draw",)));

     });
    }

  }
  return true;
}