import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quran_app/res/colors/list_color.dart';
import 'package:quran_app/res/dimension/size.dart';
import 'package:quran_app/widget/label/text_description.dart';

import '../models/surah_model.dart';
import 'surah_detail_view.dart';

class SurahListView extends StatefulWidget {
  const SurahListView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SurahListViewState createState() => _SurahListViewState();
}

class _SurahListViewState extends State<SurahListView> {
  late Future<List<Surah>> futureSurahList;
  List<Surah> originalSurahList = [];
  List<Surah> filteredSurahList = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    futureSurahList = fetchSurahList();
    searchController.addListener(() {
      filterSearchResults(searchController.text);
    });
  }

  Future<List<Surah>> fetchSurahList() async {
    final response =
        await http.get(Uri.parse('https://equran.id/api/v2/surat'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      List<Surah> surahList =
          jsonResponse.map((data) => Surah.fromJson(data)).toList();
      setState(() {
        originalSurahList = surahList;
        filteredSurahList = surahList;
      });
      return surahList;
    } else {
      throw Exception('Failed to load Surah list');
    }
  }

  void filterSearchResults(String query) {
    List<Surah> dummyListData = [];
    if (query.isNotEmpty) {
      for (var item in originalSurahList) {
        if (item.nameLatin.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        filteredSurahList = dummyListData;
      });
    } else {
      setState(() {
        filteredSurahList = originalSurahList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 6, 136, 71),
                  Color.fromARGB(255, 247, 161, 104)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: Size.sizeSymetricMarginPage),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ComponentTextDescription(
                                "Al-Quran",
                                fontSize: Size.sizeTextHeaderGlobal,
                                fontWeight: FontWeight.bold,
                                teksColor: ListColor.warnaTeksPutihGlobal,
                              ),
                              ComponentTextDescription(
                                "Mari Perbanyak Baca Al-Quran",
                                fontSize: Size.sizeTextDescriptionGlobal,
                                fontWeight: FontWeight.w500,
                                teksColor: ListColor.warnaTeksPutihGlobal,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                        Container(
                          transform: Matrix4.translationValues(0, 20.3, 0),
                          child: SvgPicture.asset(
                            "assets/icon/ic_kaligrafi.svg",
                            fit: BoxFit.cover,
                            width: 110,
                            height: 80,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 40,
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          labelText: "Search",
                          labelStyle: const TextStyle(
                              color: ListColor.warnaTeksPutihGlobal),
                          hintText: "Search Surah",
                          prefixIcon: const Icon(Icons.search), 
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Size.sizeTextHeaderGlobal)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Size.sizeTextHeaderGlobal)),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                                Radius.circular(Size.sizeTextHeaderGlobal)),
                            borderSide: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Size.roundedBorderSize,
                    ),
                    FutureBuilder<List<Surah>>(
                      future: futureSurahList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: filteredSurahList.length,
                            itemBuilder: (context, index) {
                              return cardSurah(
                                noSurah:
                                    filteredSurahList[index].number.toString(),
                                namaSurah: filteredSurahList[index].nameLatin,
                                artiSurah: filteredSurahList[index].meaning,
                                tempatTurun:
                                    filteredSurahList[index].revelationType,
                                jumlahAyat: filteredSurahList[index]
                                    .numberOfAyahs
                                    .toString(),
                                namaArab: filteredSurahList[index].name,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SurahDetailView(
                                        filteredSurahList[index].number,
                                        surahDetail: null,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else if (snapshot.hasError) {
                          return Center(child: Text("${snapshot.error}"));
                        }
                        return const Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardSurah({
    required String noSurah,
    required String namaSurah,
    required String artiSurah,
    required String tempatTurun,
    required String jumlahAyat,
    required String namaArab,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Card(
          elevation: 5.0,
          color: Colors.white,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: InkWell(
            onTap: onTap,
            splashColor: ListColor.warnaNonPrimary,
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/icon/ic_ayat.svg",
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          noSurah,
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ComponentTextDescription(
                          namaSurah,
                          fontSize: Size.sizeTextDescriptionGlobal,
                          fontWeight: FontWeight.normal,
                        ),
                        ComponentTextDescription(
                          "$tempatTurun * $jumlahAyat AYAT",
                          teksColor: ListColor.warnaTeksGrayGlobal,
                          fontSize: Size.sizeTextDescriptionGlobal,
                        ),
                        ComponentTextDescription(
                          artiSurah,
                          fontSize: Size.sizeTextDescriptionGlobal,
                          teksColor: ListColor.warnaTeksHitamGlobal,
                          maxLines: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  color: ListColor.warnaNonPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ComponentTextDescription(
                      namaArab,
                      teksColor: Colors.white,
                      fontSize: Size.sizeTextDescriptionGlobal,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
