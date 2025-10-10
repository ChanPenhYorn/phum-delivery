import 'package:flutter/foundation.dart';

class AppLogger {
  static void log(String message) {
    debugPrint(" [LOG] : $message");
  }
}
