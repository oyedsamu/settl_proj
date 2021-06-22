import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static showLog(String logTag, String value) {
    debugPrint(logTag + ": ----- " + value);
  }

  static showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: Colors.black87,
        textColor: Colors.white);
  }
}
