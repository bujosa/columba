import 'package:flutter/material.dart';

class Cronometer extends StatefulWidget {
  const Cronometer({Key? key}) : super(key: key);

  @override
  State<Cronometer> createState() => _CronometerState();
}

class _CronometerState extends State<Cronometer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        alignment: Alignment.center,
        child: const Text('Hello World',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
    );
  }
}
