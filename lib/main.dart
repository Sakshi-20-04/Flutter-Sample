import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Roll Dice'),
          backgroundColor: const Color.fromARGB(255, 253, 224, 3),
        ),
        body: GradientContainer(
          
            Color.fromARGB(255, 51, 3, 129),
            const Color.fromARGB(255, 156, 58, 241),
          
        ),
      ),
    );
  }
}


