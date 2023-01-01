import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';

class Cronometer extends StatefulWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  State<Cronometer> createState() => _CronometerState();
}

class _CronometerState extends State<Cronometer> {
  @override
  Widget build(BuildContext context) {
    final timerProvider = Provider.of<TimerProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          context
              .select((TimerProvider timeProvider) => timeProvider.currentTime),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 60,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                timerProvider.startTimer();
              },
              child: const Text('Start'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                timerProvider.pauseTimer();
              },
              child: const Text('Pause'),
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                timerProvider.restartTimer();
              },
              child: const Text('Restart'),
            ),
          ],
        ),
      ],
    );
  }
}
