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
      home: CurrencyConverterPage(),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  String jenis = "";
  double hasilKonversi = 0;
  String textRupiah = "";
  int radioValue = 0;

  void hitungKonversi() {
    if (textRupiah == "") {
      Fluttertoast.showToast(
          msg: "Masukkan nilai Rupiah yang akan di konversikan",
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.red[600],
          textColor: Colors.white);
      return;
    }
    double rupiah = double.parse(textRupiah);
    if (radioValue == 1) {
      setState(() {
        jenis = "USD";
        hasilKonversi = rupiah / 15956;
        hasilKonversi = double.parse(hasilKonversi.toStringAsFixed(2));
      });
    } else if (radioValue == 2) {
      setState(() {
        jenis = "EURO";
        hasilKonversi = rupiah / 17332;
        hasilKonversi = double.parse(hasilKonversi.toStringAsFixed(2));
      });
    } else if (radioValue == 3) {
      setState(() {
        jenis = "RINGGIT";
        hasilKonversi = rupiah / 3300;
        hasilKonversi = double.parse(hasilKonversi.toStringAsFixed(2));
      });
    } else {
      setState(() {
        jenis = "YEN";
        hasilKonversi = rupiah / 130;
        hasilKonversi = double.parse(hasilKonversi.toStringAsFixed(2));
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
          child: Text('Konversi Mata Uang'),
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
                        "IDR",
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
                        "Masukkan Nilai Rupiah",
                        style: TextStyle(fontSize: 18, color: Colors.blue[900]),
                      ),
                      SizedBox(
                        width: 100,
                        child: TextField(
                          onChanged: (e) => textRupiah = e,
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
                            "USD (15956)",
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
                            "EURO (17332)",
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
                            "RINGGIT (3300)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: radioValue,
                            onChanged: (value) {
                              setState(() {
                                radioValue = 4;
                              });
                            },
                          ),
                          Text(
                            "YEN (130)",
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
