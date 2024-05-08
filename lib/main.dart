import 'package:flutter/material.dart';
import 'package:listview/list_view_activity.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListViewActivity(),
    );
  }
}
