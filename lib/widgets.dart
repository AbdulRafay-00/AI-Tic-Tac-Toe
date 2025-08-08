import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

// Container for game
class container extends StatefulWidget {
  container(this.symbol, this.onhandel);
  String symbol = "";
  VoidCallback onhandel;

  @override
  State<container> createState() => _containerState();
}

class _containerState extends State<container> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onhandel,
      child: Container(
        color: Colors.grey,
        // height: MediaQuery.of(context).size.width*0.20,
        // width: MediaQuery.of(context).size.width*0.20,
        child: Center(
          child: Text(
            "${widget.symbol}",
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

// final GlobalKey<Result_ContainerState> myKey = GlobalKey();
List PreviousHistoryOfTwoPlayerMode = [];
List PreviousHistoryOfAiPlayerMode = [];

class Result_Container extends StatefulWidget {
  Result_Container(this.message, this.mode, {super.key});
  bool mode;
  final String message;

  @override
  State<Result_Container> createState() => Result_ContainerState();
}

class Result_ContainerState extends State<Result_Container> {
  int TwoVTwoCount() {
    int count = PreviousHistoryOfTwoPlayerMode.length + 1;
    return 5;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mode) {
      PreviousHistoryOfTwoPlayerMode.add(widget.message);
    } else {
      PreviousHistoryOfAiPlayerMode.add(widget.message);
    }
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisExtent: 60,
      ),
      itemCount: widget.mode
          ? PreviousHistoryOfTwoPlayerMode.length
          : PreviousHistoryOfAiPlayerMode.length,
      itemBuilder: (context, index) {
        // mode = true list of Two Players
        // mode = true list of Ai Players

        return widget.mode
            ? Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Match ${index + 1}: ${PreviousHistoryOfTwoPlayerMode[index]}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              )
            : Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    "Match ${index + 1}: ${PreviousHistoryOfAiPlayerMode[index]}",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              );
      },
    );
  }
}

// class to keep the match count
class MatchesCount {
  int TwoVTwoCount({reset_Length = false}) {
    bool Reset_Length = reset_Length;
    if (Reset_Length) {
      PreviousHistoryOfTwoPlayerMode.clear();
    }
    int count = PreviousHistoryOfTwoPlayerMode.length + 1;
    return count;
  }

  int AIMatchCount({reset_Length = false}) {
    bool Reset_Length = reset_Length;
    if (Reset_Length) {
      PreviousHistoryOfAiPlayerMode.clear();
    }
    int count = PreviousHistoryOfAiPlayerMode.length + 1;
    return count;
  }
}
