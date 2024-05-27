import 'package:flutter/material.dart';
import 'package:shared_pref/shared_pref_screen.dart';

void main() {
  runApp(const SharedPrefScreen());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
