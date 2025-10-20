import 'dart:async';
import 'dart:ui';

class AppBouncer {
  final int milliseconds;
  Timer? _timer;

  AppBouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void cancel() {
    _timer?.cancel();
  }
}
