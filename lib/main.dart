import 'package:flutter/material.dart';
import 'package:steps_walked_ui/screens/steps_walked/steps_walked_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepsWalkedScreen(),
    );
  }
}
