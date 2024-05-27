import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.redAccent, Colors.orangeAccent])),
              child: const SizedBox(
                width: double.infinity,
                height: 350.0,
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          "assets/images/pp.png",
                        ),
                        radius: 120.0,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Riyan",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 30.0, horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "About Me:",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontStyle: FontStyle.normal,
                          fontSize: 28.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'As a software engineering graduate, \n'
                      'I have a passion for creating inclusive applications.'
                      'My interest in technology started in vocational high school, \n'
                      'where I focused on programming. During a three-month internship'
                      'at a software company, \n I further developed my skills'
                      'and enthusiasm for IT.',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Educational Background:",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: "SD Negeri Citeureup Mandiri 1"),
                      decoration: const InputDecoration(
                        labelText: 'Sekolah Dasar',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: "MTs Negeri Sukasari"),
                      decoration: const InputDecoration(
                        labelText: 'Sekolah Menengah Pertama',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller:
                          TextEditingController(text: "SMK Negeri 2 Cimahi"),
                      decoration: const InputDecoration(
                        labelText: 'Sekolah Menengah Atas',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: "Politeknik TEDC Bandung - Teknik Informatika"),
                      decoration: const InputDecoration(
                        labelText: 'Perguruan Tinggi',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Work History:",
                      style: TextStyle(
                          color: Colors.orangeAccent,
                          fontStyle: FontStyle.normal,
                          fontSize: 24.0),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: "IT Support - Since 2017."),
                      decoration: const InputDecoration(
                        labelText: 'SMK Negeri 2 Cimahi',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text: "Frelancer Web Developer - 2019 to 2020"),
                      decoration: const InputDecoration(
                        labelText: 'CV. Multi Sarana Putra',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                    TextField(
                      readOnly: true,
                      controller: TextEditingController(
                          text:
                              "Junior Programmer - Juli 2016 to October 2016"),
                      decoration: const InputDecoration(
                        labelText: 'PT Javan Cipta Solusi',
                        labelStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        border: UnderlineInputBorder(),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 200.00,
              child: ElevatedButton(
                onPressed: () async{
                      Uri phoneno = Uri.parse('tel:+6289605201376');
                      if (await launchUrl(phoneno)) {
                          //dialer opened
                      }else{
                          throw 'Could not launch $phoneno';
                      }
                  },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.pinkAccent,
                  backgroundColor: Colors.orangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  elevation: 0.0, // Text color
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [Colors.orangeAccent, Colors.pinkAccent]),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Container(
                    constraints:
                        const BoxConstraints(maxWidth: 200.0, minHeight: 50.0),
                    alignment: Alignment.center,
                    child: const Text(
                      "Contact me",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
