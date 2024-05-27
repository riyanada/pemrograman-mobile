import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({super.key});

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  int counter = 0;
  bool isDark = false;

  @override
  void initState() {
    super.initState();
    getPreference();
  }

  //untuk mengurangi angka
  void minus() {
    setState(() {
      counter = counter - 1;
      setPreference();
    });
  }

  //untuk menambah angka
  void add() {
    setState(() {
      counter = counter + 1;
      setPreference();
    });
  }

  // untuk mengganti thema
  void changeTheme() {
    setState(() {
      isDark = !isDark;
      setPreference();
    });
  }

  // untuk refresh
  void refresh() {
    setState(() {
      counter = 0;
      isDark = false;
      setPreference();
    });
  }

  Future<void> setPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final myData = json.encode({
      'counter': counter.toString(),
      'isDark': isDark.toString(),
    });

    pref.setString('myData', myData);
  }

  Future<void> getPreference() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.containsKey('myData')) {
      final myData =
          json.decode(pref.getString('myData')!) as Map<String, dynamic>;

      setState(() {
        counter = int.parse(myData["counter"]);
        isDark = myData['isDark'] == "true";
      });
    }
  }

  ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xff39A2DB),
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.white,
        side: const BorderSide(
          color: Colors.white,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  ThemeData bright = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff39A2DB),
    primarySwatch: Colors.amber,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        side: const BorderSide(
          color: Colors.black,
          width: 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? dark : bright,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Counter Apps'),
          actions: [
            IconButton(onPressed: refresh, icon: const Icon(Icons.refresh))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Angka saat ini adalah : $counter',
                style: const TextStyle(fontSize: 25),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: minus,
                    child: const Icon(Icons.remove),
                  ),
                  OutlinedButton(
                    onPressed: add,
                    child: const Icon(Icons.add),
                  ),
                ],
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: changeTheme,
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
