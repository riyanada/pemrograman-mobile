import 'package:flutter/material.dart';

class Ormawa {
  final String name;
  final String description;

  Ormawa(this.name, this.description);
}

class OrmawaPage extends StatelessWidget {
  OrmawaPage({super.key});

  final List<Ormawa> ormawaList = [
    Ormawa('Himpunan Mahasiswa Teknik Informatika (HMTI)',
        'Organisasi Mahasiswa Program Studi Teknik Informatika'),
    Ormawa('Himpunan Mahasiswa Akuntansi (Rumahkutedc)',
        'Organisasi Mahasiswa Program Studi Akuntansi'),
    Ormawa('Himpunan Mahasiswa Kesehatan (HIMAKES)',
        'Organisasi Mahasiswa Program Studi Kesehatan'),
    Ormawa('Himpunan Mahasiswa Kimia (HIMATEK)',
        'Organisasi Mahasiswa Program Studi Kimia'),
    Ormawa('Himpunan Mahasiswa Elektro (HME)',
        'Organisasi Mahasiswa Program Studi Teknik Elektro'),
    Ormawa('Himpunan Mahasiswa Mesin (HMM)',
        'Organisasi Mahasiswa Program Studi Teknik Mesin'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Daftar Organisasi Mahasiswa'),
        ),
        body: ListView.builder(
          itemCount: ormawaList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 2, 
              margin: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16),
              child: ListTile(
                title: Text(ormawaList[index].name),
                subtitle: Text(ormawaList[index].description),
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
