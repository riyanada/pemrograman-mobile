import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'currency_bloc.dart';
import 'currency_event.dart';
import 'currency_state.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CurrencyBloc(),
        child: const CurrencyConverterPage(),
      ),
    );
  }
}

class CurrencyConverterPage extends StatefulWidget {
  const CurrencyConverterPage({super.key});

  @override
  State<CurrencyConverterPage> createState() => _CurrencyConverterPageState();
}

class _CurrencyConverterPageState extends State<CurrencyConverterPage> {
  final TextEditingController _controller = TextEditingController();
  int _radioValue = 0;

  void _onRadioChanged(int? value) {
    setState(() {
      _radioValue = value ?? 0;
    });
  }

  void _onConvertPressed(BuildContext context) {
    final String text = _controller.text;
    if (text.isEmpty) {
      Fluttertoast.showToast(
        msg: "Masukkan nilai Rupiah yang akan dikonversikan",
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.red[600],
        textColor: Colors.white,
      );
      return;
    }

    final double amount = double.parse(text);
    context.read<CurrencyBloc>().add(ConvertCurrency(amount, _radioValue));
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
              decoration: BoxDecoration(color: Colors.amber[100]),
              child: SingleChildScrollView(
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
                          color: Colors.green[100],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<CurrencyBloc, CurrencyState>(
                          builder: (context, state) {
                            if (state is CurrencyInitial) {
                              return Text(
                                "Hasil Konversi",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green[800],
                                ),
                              );
                            } else if (state is CurrencyConversionResult) {
                              return Text(
                                "Hasil Konversi ke ${state.currency} adalah ${state.result}",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.green[800],
                                ),
                              );
                            } else if (state is CurrencyError) {
                              return Text(
                                state.message,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.red[800],
                                ),
                              );
                            }
                            return Container();
                          },
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
              decoration: BoxDecoration(color: Colors.blue[100]),
              child: SingleChildScrollView(
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
                          controller: _controller,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
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
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _onRadioChanged,
                          ),
                          Text(
                            "USD (15956)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _onRadioChanged,
                          ),
                          Text(
                            "EURO (17332)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 3,
                            groupValue: _radioValue,
                            onChanged: _onRadioChanged,
                          ),
                          Text(
                            "RINGGIT (3300)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(
                            value: 4,
                            groupValue: _radioValue,
                            onChanged: _onRadioChanged,
                          ),
                          Text(
                            "YEN (130)",
                            style: TextStyle(
                                fontSize: 18, color: Colors.blue[900]),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                          onPressed: () => _onConvertPressed(context),
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
                      ),
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
