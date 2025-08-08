import "package:flutter/material.dart";

class containers extends StatefulWidget {
  containers(this.symbol, this.onhandel, this.turns, {super.key});
  String symbol;
  bool turns;
  VoidCallback onhandel;

  @override
  State<containers> createState() => _containerState();
}

class _containerState extends State<containers> {
  @override
  Widget build(BuildContext context) {
    return widget.turns
        ? GestureDetector(
            onTap: widget.onhandel,
            child: Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  widget.symbol,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        : Container(
            color: Colors.grey,
            child: Center(
              child: Text(
                widget.symbol,
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          );
  }
}
