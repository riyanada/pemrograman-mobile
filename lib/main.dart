import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastPage extends StatefulWidget {
  const ToastPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToastPageState createState() => _ToastPageState();
}

class _ToastPageState extends State<ToastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Toast'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: const Text('Show Long Toast'),
                  onPressed: () {
                    Fluttertoast.showToast(
                      msg: "This is Long Toast",
                      toastLength: Toast.LENGTH_LONG,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: const Text('Show Short Toast'),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "This is Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        timeInSecForIosWeb: 1);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: const Text('Show Center Short Toast'),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "This is Center Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: const Text('Show Top Short Toast'),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "This is Top Short Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.TOP,
                        timeInSecForIosWeb: 1);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                  child: const Text('Show Colored Toast'),
                  onPressed: () {
                    Fluttertoast.showToast(
                        msg: "This is Colored Toast",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.greenAccent,
                        textColor: Colors.black54);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ToastPage(),
    );
  }
}
