import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Dialog Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Show Material Dialog'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Material Dialog'),
                          content: const Text('Hey! I am Coflutter!'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('close')),
                            TextButton(
                              onPressed: () {
                                print('Hello World!');
                                Navigator.pop(context);
                              },
                              child: const Text('Hello World!'),
                            )
                          ],
                        );
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Show Cupertino Dialog'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return CupertinoAlertDialog(
                          title: const Text('Cupertino Dialog'),
                          content: const Text('Hey! I am Coflutter!'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('close')),
                            TextButton(
                              onPressed: () {
                                print('Hello World!');
                                Navigator.pop(context);
                              },
                              child: const Text('Hello World!'),
                            )
                          ],
                        );
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Show Loading Dialog for 30 seconds'),
                onPressed: () {
                  late Timer _timer;
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      _timer = Timer(const Duration(seconds: 30), () {
                        Navigator.of(context).pop();
                      });
                      return AlertDialog(
                        content: Row(
                          children: [
                            const CircularProgressIndicator(),
                            Container(
                                margin: const EdgeInsets.only(left: 7),
                                child: const Text("Loading please wait ..")),
                          ],
                        ),
                      );
                    },
                  ).then((value) => {
                        if (_timer.isActive) {_timer.cancel()}
                      });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: const Text('Show Simple Dialog'),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: const Text('Chose an Option'),
                          children: <Widget>[
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Option 1'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Option 2'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Option 3'),
                            ),
                            SimpleDialogOption(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Option 4'),
                            ),
                          ],
                        );
                      });
                },
              )
            ],
          ),
        ));
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
      home: const DialogPage(),
    );
  }
}
