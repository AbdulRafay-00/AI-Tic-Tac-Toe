import"package:flutter/material.dart";

class container extends StatefulWidget {

  container( this.symbol,  this.onhandel);
  String  symbol="";
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
        child:Center(
          child: Text("${widget.symbol}",style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: Colors.white),),
        ) ,
      ),
    );
  }
}



class Elevated_Button extends StatelessWidget {
  const Elevated_Button({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

