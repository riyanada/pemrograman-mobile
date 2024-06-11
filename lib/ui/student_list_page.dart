// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login_flutter/page.dart';

class StudentListPage extends StatefulWidget {
  final String prodi;

  const StudentListPage({super.key, required this.prodi});

  @override
  // ignore: library_private_types_in_public_api
  _StudentListPageState createState() => _StudentListPageState();
}

class _StudentListPageState extends State<StudentListPage> {
  bool _isLoading = true;
  List<dynamic> _students = [];

  @override
  void initState() {
    super.initState();
    _fetchStudentData();
  }

  Future<void> _fetchStudentData() async {
    final response = await http.get(
      Uri.parse(
          'http://rismayana.diary-project.com/bio.php?prodi=${widget.prodi}'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        // Menggunakan metode `isNotEmpty` untuk mengecek apakah list data tidak kosong
        setState(() {
          _students = data;
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = false;
        });
        _showErrorDialog(context, 'Tidak ada data untuk Prodi ini.', true);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      _showErrorDialog(
          context, 'Failed to load data. Please try again later.', true);
    }
  }

  void _showErrorDialog(
      BuildContext context, String message, bool navigateToHome) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyHomePage(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _students.length,
              itemBuilder: (context, index) {
                final student = _students[index];
                return ListTile(
                  title: Text(student['nama']),
                  subtitle: Text('NIM: ${student['nim']}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentDetailPage(student: student),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final Map<String, dynamic> student;

  const StudentDetailPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(student['nama']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('NIM: ${student['nim']}',
                style: const TextStyle(fontSize: 16)),
            Text('Prodi: ${student['prodi']}',
                style: const TextStyle(fontSize: 16)),
            Text('Agama: ${student['agama']}',
                style: const TextStyle(fontSize: 16)),
            Text('Jenis Kelamin: ${student['jns_kel']}',
                style: const TextStyle(fontSize: 16)),
            Text('Alamat: ${student['alamat']}',
                style: const TextStyle(fontSize: 16)),
            Text('Asal Sekolah: ${student['asal_sekolah']}',
                style: const TextStyle(fontSize: 16)),
            Text('Tahun: ${student['tahun']}',
                style: const TextStyle(fontSize: 16)),
            Text('Tempat Lahir: ${student['tempat_lahir']}',
                style: const TextStyle(fontSize: 16)),
            Text('Tanggal Lahir: ${student['tanggal_lahir']}',
                style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
