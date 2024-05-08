import 'package:listview/item_list.dart';
import 'package:listview/user_model.dart';
import 'package:flutter/material.dart';

class ListViewActivity extends StatefulWidget {
  const ListViewActivity({super.key});


  @override
  State<StatefulWidget> createState() => ListViewActivityState();
}

class ListViewActivityState extends State<ListViewActivity> {
  List<UserModel> data = [
    UserModel(1, "IK", "Ikhwan Koto", "Sistem Informasi"),
    UserModel(2, "PA", "Pake Arrayid", "Fisika"),
    UserModel(3, "RK", "Ryan Kimo", "Olah Raga"),
    UserModel(4, "AM", "Arif Mahran", "Biologi"),
    UserModel(5, "NH", "Nurrahman Hado", "Sistem Komputer"),
    UserModel(6, "AN", "Ade Nuri", "Psikologi"),
    UserModel(7, "FC", "Fitriani Chairi", "Ilmu Komputer"),
    UserModel(8, "EA", "Elsa Aprilio", "Teknik Mesin"),
    UserModel(9, "PC", "Putri Coti", "Teknik Industri"),
    UserModel(10, "SE", "Saputra Enriko", "Geografi"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "ListView.Builder",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemUser(index, data[index], (dataModel) {
                onListClick(dataModel);
              });
            }),
      ),
    );
  }

  onListClick(UserModel dataUser) {
    // ignore: avoid_print
    print("Data: ${dataUser.name}");
  }
}