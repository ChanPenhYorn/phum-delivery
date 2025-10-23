import 'package:get/get.dart';

class Logger {
  static void log(String message) {
    Get.log(" [LOG] : $message");
  }
}
