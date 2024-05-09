// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Friends',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0;

  final List<Map<String, String>> _friends = [
    {
      'name': 'Alma Sulaiman',
      'nim': 'D112121065',
      'imageAsset': 'assets/images/alma.png',
      'additionalInfo': 'Apapun masalahnya, Live solusinya!',
    },
    {
      'name': 'Ikhsan Fauzan',
      'nim': 'D112121063',
      'imageAsset': 'assets/images/ikhsan.png',
      'additionalInfo': 'Menjual berbagai emas!',
    },
    {
      'name': 'Nur Hidayat',
      'nim': 'D112121058',
      'imageAsset': 'assets/images/nur.jpg',
      'additionalInfo': 'Suhu nih bos senggol dong',
    },
    {
      'name': 'Sarah Fadilah',
      'nim': 'D112121064',
      'imageAsset': 'assets/images/sarah.jpeg',
      'additionalInfo': 'Nice to meet you!',
    },
    {
      'name': 'Wahyu Safrizal',
      'nim': 'D112121056',
      'imageAsset': 'assets/images/way.png',
      'additionalInfo': 'My Cars is Fast!',
    },
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
        title: const Text('Profile Friends'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage:
                  AssetImage(_friends[_selectedIndex]['imageAsset']!),
            ),
            const SizedBox(height: 20),
            Text(
              _friends[_selectedIndex]['name']!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(_friends[_selectedIndex]['nim']!),
            const SizedBox(height: 20),
            Text(_friends[_selectedIndex]['additionalInfo']!),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(_friends[0]['imageAsset']!),
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
            label: _friends[0]['name']?.split(' ')[0],
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(_friends[1]['imageAsset']!),
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
            label: _friends[1]['name']?.split(' ')[0],
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(_friends[2]['imageAsset']!),
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
            label: _friends[2]['name']?.split(' ')[0],
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(_friends[3]['imageAsset']!),
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
            label: _friends[3]['name']!.split(' ')[0],
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              backgroundImage: AssetImage(_friends[4]['imageAsset']!),
              backgroundColor: Colors.transparent,
              radius: 12,
            ),
            label: _friends[4]['name']!.split(' ')[0],
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.purple,
        backgroundColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}
