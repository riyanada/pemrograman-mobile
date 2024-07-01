import 'package:flutter/material.dart';
import 'view/surah_list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Al-Quran',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const SurahListView(),
    );
  }
}
