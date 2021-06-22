import 'package:flutter/material.dart';

class Utils {
  static showLog(String logTag, String value) {
    debugPrint(logTag + ": ----- " + value);
  }
}
