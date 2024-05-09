import 'package:flutter/material.dart';

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
        title: const Text('Detail Teman Baiq'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: imageAsset.length != 2 ? AssetImage(imageAsset) : null,
              radius: 60,
              child: imageAsset.length == 2
                  ? Text(
                      imageAsset,
                      style:
                          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  : null,
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
