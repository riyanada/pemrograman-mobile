import 'package:flutter/material.dart';
import 'package:parsing_json/json_list/user_model.dart';
import 'package:parsing_json/json_list/user_view_model.dart';

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HalamanUtamaState createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  List<UserModel> dataUser = [];
  bool isLoading = true;

  void getDataUser() {
    UserViewModel().getUsers().then((value) {
      setState(() {
        if (value != null) {
          dataUser = value;
        }
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Halaman Utama"),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataUser.length,
              itemBuilder: (context, i) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(dataUser[i].name[0]),
                    ),
                    title: Text(dataUser[i].name),
                    subtitle: Text(dataUser[i].email),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserDetailPage(user: dataUser[i]),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}

class UserDetailPage extends StatelessWidget {
  final UserModel user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username: ${user.username}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Email: ${user.email}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Phone: ${user.phone}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Website: ${user.website}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            const Text('Address:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Street: ${user.address.street}',
                style: const TextStyle(fontSize: 18)),
            Text('Suite: ${user.address.suite}',
                style: const TextStyle(fontSize: 18)),
            Text('City: ${user.address.city}',
                style: const TextStyle(fontSize: 18)),
            Text('Zipcode: ${user.address.zipcode}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 16),
            const Text('Company:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Name: ${user.company.name}',
                style: const TextStyle(fontSize: 18)),
            Text('CatchPhrase: ${user.company.catchPhrase}',
                style: const TextStyle(fontSize: 18)),
            Text('BS: ${user.company.bs}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
