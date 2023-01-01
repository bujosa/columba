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
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'Columba Timer',
          style: TextStyle(
            color: Colors.white,
            fontSize: 65,
            fontFamily: 'Caveat',
            fontWeight: FontWeight.bold,
          ),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                context.select(
                    (TimerProvider timeProvider) => timeProvider.currentTime),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 75,
                ),
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {
                  timerProvider.restartTimer();
                },
                child: const Icon(
                  Icons.restart_alt,
                  color: Colors.orange,
                  size: 80,
                ),
              ),
              timerProvider.isPaused
                  ? ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        timerProvider.startTimer();
                      },
                      child: const Icon(
                        Icons.play_circle_outline,
                        color: Colors.green,
                        size: 80,
                      ),
                    )
                  : ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                      onPressed: () {
                        timerProvider.pauseTimer();
                      },
                      child: const Icon(
                        Icons.pause_circle_outline,
                        color: Colors.red,
                        size: 80,
                      ),
                    ),
            ],
          ),
        ]),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      ],
    );
  }
}
