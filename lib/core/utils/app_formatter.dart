import 'package:intl/intl.dart';

class AppFormatter {
  static String formatDateTime(String dateTime) {
    return DateFormat('dd MMM yyyy, HH:mm a').format(DateTime.parse(dateTime));
  }
}
