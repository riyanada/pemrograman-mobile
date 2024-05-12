import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    ProdiPage(),
    OrmawaPage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TEDC App'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Prodi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Ormawa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Prodi {
  final String name;
  final String description;

  Prodi(this.name, this.description);
}

class ProdiPage extends StatelessWidget {
  ProdiPage({super.key});

  final List<Prodi> prodiList = [
    Prodi('Teknik Informatika', 'Program Studi Teknik Informatika'),
    Prodi('Sistem Informasi', 'Program Studi Sistem Informasi'),
    Prodi('Teknik Elektro', 'Program Studi Teknik Elektro'),
    Prodi('Teknik Mesin', 'Program Studi Teknik Mesin'),
    Prodi('Teknik Industri', 'Program Studi Teknik Industri'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List Prodi'),
        ),
        body: ListView.builder(
          itemCount: prodiList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(prodiList[index].name),
              subtitle: Text(prodiList[index].description),
              onTap: () {
                // Tambahkan logika saat item prodi diklik di sini
              },
            );
          },
        ),
      ),
    );
  }
}

class Ormawa {
  final String name;
  final String description;

  Ormawa(this.name, this.description);
}

class OrmawaPage extends StatelessWidget {
  OrmawaPage({super.key});
  
  final List<Ormawa> ormawaList = [
    Ormawa('Himpunan Mahasiswa Informatika', 'Organisasi Mahasiswa Prodi Teknik Informatika'),
    Ormawa('Himpunan Mahasiswa Sistem Informasi', 'Organisasi Mahasiswa Prodi Sistem Informasi'),
    Ormawa('Himpunan Mahasiswa Elektro', 'Organisasi Mahasiswa Prodi Teknik Elektro'),
    Ormawa('Himpunan Mahasiswa Mesin', 'Organisasi Mahasiswa Prodi Teknik Mesin'),
    Ormawa('Himpunan Mahasiswa Industri', 'Organisasi Mahasiswa Prodi Teknik Industri'),
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('List ORMawa'),
        ),
        body: ListView.builder(
          itemCount: ormawaList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(ormawaList[index].name),
              subtitle: Text(ormawaList[index].description),
              onTap: () {
                // Tambahkan logika saat item ormawa diklik di sini
              },
            );
          },
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Saia Ganteng',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Data Diri',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Umur: 30 tahun'),
              Text('Alamat: Jl. Contoh No. 123'),
              Divider(),
              Text(
                'Riwayat Pendidikan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('SD: SD Contoh'),
              Text('SMP: SMP Contoh'),
              Text('SMA: SMA Contoh'),
              Divider(),
              Text(
                'Riwayat Pekerjaan',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text('Perusahaan A: Posisi A'),
              Text('Perusahaan B: Posisi B'),
              Text('Perusahaan C: Posisi C'),
            ],
          ),
        ),
      ),
    );
  }
}