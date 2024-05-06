import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biodata Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BiodataPage(),
    );
  }
}

class BiodataPage extends StatelessWidget {
  const BiodataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Biodata'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Nama: Riyan',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Umur: 25 tahun',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat: Jl. Kamarung No.69',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Pekerjaan: Mahasiswa',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
