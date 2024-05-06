import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Week 4';
    FocusNode nodeOne = FocusNode();
    FocusNode nodeTwo = FocusNode();

    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                focusNode: nodeOne,
                decoration:
                    const InputDecoration(prefixIcon: Icon(Icons.print)),
              ),
              TextField(
                focusNode: nodeTwo,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  prefix: CircularProgressIndicator(),
                ),
              ),
              TextButton(
                child: Text("Button"),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  side: BorderSide(color: Colors.deepOrange, width: 1),
                  elevation: 20,
                  minimumSize: Size(100, 50),
                  shadowColor: Colors.red,
                ),
                onPressed: () {},
              ),
              TextButton.icon(
                icon: Icon(Icons.save),
                label: Text("TextButton"),
                onPressed: () {},
              ),
              ElevatedButton(
                child: Text("ElevatedButton"),
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                    disabledForegroundColor: Colors.grey.withOpacity(0.38),
                    disabledBackgroundColor: Colors.grey.withOpacity(0.12),
                    side: BorderSide(color: Colors.black, width: 1),
                    elevation: 20,
                    minimumSize: Size(150, 50),
                    shadowColor: Colors.teal,
                    padding: EdgeInsets.only(
                        left: 80, right: 80, top: 15, bottom: 15)),
                onPressed: () {},
              ),
              OutlinedButton(
                child: Text("OutlinedButton"),
                style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.blueGrey,
                    disabledForegroundColor:
                        Colors.orangeAccent.withOpacity(0.38),
                    side: BorderSide(color: Colors.deepOrange, width: 1),
                    elevation: 20,
                    minimumSize: Size(100, 50),
                    shadowColor: Colors.deepOrange,
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 100)),
                onPressed: () {},
              ),
              OutlinedButton.icon(
                icon: Icon(Icons.save),
                label: Text("Outline Icon"),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {
                  FocusScope.of(context).requestFocus(nodeTwo);
                },
                child: const Text("Next Field"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
