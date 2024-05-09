import 'package:listview/item_list.dart';
import 'package:listview/user_model.dart';
import 'package:listview/detail_user.dart';
import 'package:flutter/material.dart';

class ListViewActivity extends StatefulWidget {
  const ListViewActivity({super.key});

  @override
  State<StatefulWidget> createState() => ListViewActivityState();
}

class ListViewActivityState extends State<ListViewActivity> {
  List<UserModel> data = [
    UserModel(1, "AG", "Andre Gunawan", "D112121051"),
    UserModel(2, "ER", "Encep Rahman Armana", "D112121053"),
    UserModel(3, "assets/images/ikhsan.png", "Ikhsan Fauzan", "D112121054"),
    UserModel(4, "assets/images/sarah.jpeg", "Sarah Fadilah Sulaeman", "D112121055"),
    UserModel(5, "assets/images/way.png", "Wahyu Safrizal", "D112121056"),
    UserModel(6, "assets/images/nur.jpg", "Nur Hidayat", "D112121057"),
    UserModel(7, "PW", "Panji Wiranto", "D112121058"),
    UserModel(8, "assets/images/riyan.jpg", "Riyan", "D112121062"),
    UserModel(9, "assets/images/alma.png", "Alma Sulaiman", "D112111015"),
    UserModel(10, "SE", "Saputra Enriko", "Geografi"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const Text(
          "Absensi IF-6K",
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          name: dataUser.name,
          nim: dataUser.nim,
          imageAsset: dataUser.codeName,
          additionalInfo: 'Menjual berbagai emas!',
        ),
      ),
    );
  }
}
