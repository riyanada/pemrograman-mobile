import 'package:flutter/material.dart';

class Prodi {
  final String name;
  final String description;

  Prodi(this.name, this.description);
}

class ProdiPage extends StatelessWidget {
  ProdiPage({super.key});

  final List<Prodi> prodiList = [
    Prodi('D3 - Teknik Mesin', 'Program Studi Teknik Mesin'),
    Prodi('D3 - Teknik Elektronika', 'Program Studi Teknik Elektro'),
    Prodi('D3 - Teknik Kimia', 'Program Studi Teknik Kimia'),
    Prodi('D3 - Akuntansi', 'Program Studi Akuntansi'),
    Prodi('D3 - Teknik Komputer', 'Program Studi Teknik Komputer'),
    Prodi('D3 - Mesin Otomotif / Mekanik Otomotif',
        'Program Studi Mekanik Otomotif'),
    Prodi('D3 - Mesin Otomotif / Alat Berat', 'Program Studi Alat Berat'),
    Prodi('D3 - Rekam Medik dan Informasi Kesehatan',
        'Program Studi Rekam Medik dan Informasi Kesehatan'),
    Prodi('D4 - Teknik Informatika', 'Program Studi Teknik Informatika'),
    Prodi('D4 - Mekanik Industri dan Desain',
        'Program Studi Mekanik Industri dan Desain'),
    Prodi('D4 - Mekatronik', 'Program Studi Mekatronik'),
    Prodi('D4 - Teknik Otomasi Industri',
        'Program Studi Teknik Otomasi Industri'),
    Prodi('D4 - Konstruksi Bangunan (Sipil)',
        'Program Studi Konstruksi Bangunan (SIPIL)'),
    Prodi('D4 - Komputerisasi Akuntansi',
        'Program Studi Komputerisasi Akuntansi'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Program Studi'),
        ),
        body: ListView.builder(
          itemCount: prodiList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16),
              child: ListTile(
                title: Text(prodiList[index].name),
                subtitle: Text(prodiList[index].description),
                onTap: () {
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
