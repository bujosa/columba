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
    timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      isPaused ? timer.cancel() : time += 100;
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

  void resumeTimer() {
    if (!isPaused) return;
    isPaused = false;
    startTimer();
    notifyListeners();
  }

  String get currentTime {
    if (!isRunning) {
      return '00:00:00:00';
    }
    // Miliseconds to hours, minutes, seconds and miliseconds
    final hours = ((time / 1000) / 60 / 60).floor().toString().padLeft(2, '0');
    final minutes = ((time / 1000) / 60).floor().toString().padLeft(2, '0');
    final seconds = ((time / 1000) % 60).floor().toString().padLeft(2, '0');
    final milliseconds = (time % 1000).floor().toString().padLeft(2, '0');

    // final hours = ((time / 60) / 60).floor().toString().padLeft(2, '0');
    // final minutes = ((time / 60) % 60).floor().toString().padLeft(2, '0');
    // final seconds = (time % 60).floor().toString().padLeft(2, '0');
    // final milliseconds = (time % 100).floor().toString().padLeft(2, '0');

    return "$hours:$minutes:$seconds:$milliseconds";
  }
}
