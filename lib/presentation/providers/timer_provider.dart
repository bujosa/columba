import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider extends ChangeNotifier {
  late Timer timer;
  int time = 0;
  bool isPaused = false;
  bool isRunning = false;

  void startTimer() {
    isPaused = false;
    isRunning = true;
    timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      isPaused ? timer.cancel() : time += 10;
      notifyListeners();
    });
  }

  void pauseTimer() {
    if (isPaused) return;

    isPaused = true;
    notifyListeners();
  }

  void restartTimer() {
    time = 0;
    isPaused = false;
    isRunning = false;
    notifyListeners();
  }

  String get currentTime {
    if (!isRunning) {
      return '00:00.00';
    }

    final hours = ((time / 1000) / 60 / 60).floor().toString().padLeft(2, '0');
    final minutes = ((time / 1000) / 60).floor().toString().padLeft(2, '0');
    final seconds = ((time / 1000) % 60).floor().toString().padLeft(2, '0');
    final milliseconds =
        (time % 1000).floor().toString().padLeft(2).substring(0, 2);

    if (hours == '00') {
      return "$minutes:$seconds.$milliseconds";
    }

    return "$hours:$minutes:$seconds.$milliseconds";
  }
}
