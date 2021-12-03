import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Future warnUser(String warn){
  return Fluttertoast.showToast(
      msg: warn,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.deepPurpleAccent,
      textColor: Colors.white,
      fontSize: 16.0
  );
}