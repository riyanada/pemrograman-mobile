import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RadioButtonPage(),
    );
  }
}

class RadioButtonPage extends StatefulWidget {
  const RadioButtonPage({super.key});

  @override
  State<RadioButtonPage> createState() => _RadioButtonPageState();
}

class _RadioButtonPageState extends State<RadioButtonPage> {
  String jenis = "";
  double hasilKonversi = 0;
  String textCelcius = "";
  int radioValue = 0;

  void hitungKonversi() {
    if (textCelcius == "") {
      Fluttertoast.showToast(
          msg: "Masukkan nilai suhu yang akan di konversikan",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red[600],
          textColor: Colors.white);
      return;
    }
    double celsius = double.parse(textCelcius);
    if (radioValue == 1) {
      setState(() {
        jenis = "Reamur";
        hasilKonversi = (4 / 5) * celsius;
      });
    } else if (radioValue == 2) {
      setState(() {
        jenis = "Kelvin";
        hasilKonversi = 273 + celsius;
      });
    } else {
      setState(() {
        jenis = "Fahrenheit";
        hasilKonversi = (9 / 5 * celsius) + 32;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.center,
          child: Text('Konversi Suhu'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.amber[100]),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "\u00b0C",
                        style: TextStyle(
                            fontSize: 100,
                            fontWeight: FontWeight.bold,
                            color: Colors.green[100]),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            jenis == ""
                                ? "Hasil Konversi"
                                : "Hasil Konversi ke $jenis adalah $hasilKonversi",
                            style: TextStyle(
                                fontSize: 20, color: Colors.green[800]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  margin: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Masukkan Nilai Celcius",
                        style: TextStyle(fontSize: 18, color: Colors.blue[900]),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          onChanged: (e) => textCelcius = e,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.black54),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Pilih Konversi",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 18,
                                color: Colors.blue[900],
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = 1;
                              });
                            },
                          ),
                          Text(
                            "Reamur",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = 2;
                              });
                            },
                          ),
                          Text(
                            "Kelvin",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = 3;
                              });
                            },
                          ),
                          Text(
                            "Fahrenheit",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () {
                            hitungKonversi();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text(
                            "Hitung",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
