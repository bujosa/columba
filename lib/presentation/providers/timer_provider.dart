import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  Duration duration = const Duration(seconds: 60);
  bool isPaused = false;

  void startTimer() {
    isPaused = false;
    notifyListeners();
  }

  void pauseTimer() {
    if (isPaused) return;

    isPaused = true;
    notifyListeners();
  }

  void restartTimer() {
    duration = const Duration(seconds: 60);
    notifyListeners();
  }

  void resumeTimer() {
    if (!isPaused) return;
    isPaused = false;
    notifyListeners();
  }
}
