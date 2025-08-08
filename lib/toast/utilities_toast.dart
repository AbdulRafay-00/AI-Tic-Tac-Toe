import 'package:fluttertoast/fluttertoast.dart';
import"package:flutter/material.dart";
class toast{
  util_toast(String Error_massage){
    Fluttertoast.showToast(
        msg: Error_massage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}