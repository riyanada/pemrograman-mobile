import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teman Nurhidayat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.purple[50],
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teman Nurhidayat'),
      ),
      body: ListView(
        children: [
          ProfileCard(
            name: 'Nur Hidayat',
            nim: 'D112121057',
            imageAsset: 'assets/images/nur.png',
            additionalInfo: 'Suhu nih bos senggol dong',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    name: 'Nur Hidayat',
                    nim: 'D112121058',
                    imageAsset: 'assets/images/nur.png',
                    additionalInfo: 'Suhu nih bos senggol dong',
                  ),
                ),
              );
            },
          ),
          ProfileCard(
            name: 'Ikhsan Fauzan',
            nim: 'D112121055',
            imageAsset: 'assets/images/ikhsan.png',
            additionalInfo: 'Menjual berbagai emas!',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    name: 'Ikhsan Fauzan',
                    nim: 'D112121063',
                    imageAsset: 'assets/images/ikhsan.png',
                    additionalInfo: 'Menjual berbagai emas!',
                  ),
                ),
              );
            },
          ),
          ProfileCard(
            name: 'Sarah Fadilah',
            nim: 'D112121064',
            imageAsset: 'assets/images/sarah.jpeg',
            additionalInfo: 'Nice to meet you!',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    name: 'Sarah Fadilah',
                    nim: 'D112121064',
                    imageAsset: 'assets/images/sarah.jpeg',
                    additionalInfo: 'Nice to meet you!',
                  ),
                ),
              );
            },
          ),
          ProfileCard(
            name: 'Alma Sulaiman',
            nim: 'D112121065',
            imageAsset: 'assets/images/alma.png',
            additionalInfo: 'Apapun masalahnya, Live solusinya!',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    name: 'Alma Sulaiman',
                    nim: 'D112121065',
                    imageAsset: 'assets/images/alma.png',
                    additionalInfo: 'Apapun masalahnya, Live solusinya!',
                  ),
                ),
              );
            },
          ),
          ProfileCard(
            name: 'Wahyu Safrizal',
            nim: 'D112121056',
            imageAsset: 'assets/images/way.png',
            additionalInfo: 'My Cars is Fast!',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailPage(
                    name: 'Wahyu Safrizal',
                    nim: 'D112121056',
                    imageAsset: 'assets/images/way.png',
                    additionalInfo: 'My Cars is Fast!',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  final String name;
  final String nim;
  final String imageAsset;
  final String additionalInfo;
  final VoidCallback onTap;

  const ProfileCard({
    super.key,
    required this.name,
    required this.nim,
    required this.imageAsset,
    required this.additionalInfo,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(imageAsset),
        ),
        title: Text(name),
        subtitle: Text(nim),
        onTap: onTap,
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String name;
  final String nim;
  final String imageAsset;
  final String additionalInfo;

  const DetailPage({
    super.key,
    required this.name,
    required this.nim,
    required this.imageAsset,
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Teman Nurhidayat'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imageAsset),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(nim),
            const SizedBox(height: 20),
            Text(additionalInfo),
          ],
        ),
      ),
    );
  }
}
