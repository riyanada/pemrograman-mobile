import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quran_app/widget/button/button_back.dart';
import 'package:quran_app/widget/label/text_description.dart';
import 'package:quran_app/models/qori_model.dart';
import 'package:quran_app/res/dimension/size.dart';
import 'package:quran_app/res/colors/list_color.dart';

import '../models/surah_detail_model.dart';

class SurahDetailView extends StatefulWidget {
  final int number;
  final SurahDetailModel? surahDetail;

  const SurahDetailView(this.number, {super.key, this.surahDetail});

  @override
  // ignore: library_private_types_in_public_api
  _SurahDetailViewState createState() => _SurahDetailViewState();
}

class _SurahDetailViewState extends State<SurahDetailView>
    with TickerProviderStateMixin {
  SurahDetailModel? _surahDetail;
  bool _isLoading = true;
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _currentAudioUrl;
  QoriModel? selectedQori;
  List<QoriModel> listQori = [
    QoriModel("Abdullah Al Juhhany", "assets/icon/syeikh_1.png", "01"),
    QoriModel("Abdullah Muhsin Al Qasim", "assets/icon/syeikh_2.png", "02"),
    QoriModel("Abdurrahman as Sudais", "assets/icon/syeikh_3.png", "03"),
    QoriModel("Ibrahim-Al-Dossari", "assets/icon/syeikh_4.png", "04"),
    QoriModel("Misyari Rasyid Al-'Afasi", "assets/icon/syeikh_5.png", "05")
  ];

  @override
  void initState() {
    super.initState();
    _fetchSurahDetail();
  }

  Future<void> _fetchSurahDetail() async {
    final response = await http
        .get(Uri.parse('https://equran.id/api/v2/surat/${widget.number}'));

    if (response.statusCode == 200) {
      setState(() {
        _surahDetail = SurahDetailModel.fromJson(json.decode(response.body));
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _playAudio(String url) async {
    if (_currentAudioUrl != url) {
      await _audioPlayer.stop();
      _currentAudioUrl = url;
      await _audioPlayer.play(UrlSource(url));
    } else {
      if (_audioPlayer.state == PlayerState.playing) {
        await _audioPlayer.pause();
      } else {
        await _audioPlayer.resume();
      }
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
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
                  Color.fromARGB(255, 250, 223, 192)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            width: double.infinity,
            height: double.infinity,
          ),
          SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Size.sizeSymetricMarginPage),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonBack(
                          () {
                            Navigator.of(context).pop();
                            _audioPlayer.stop();
                          },
                          isArrowLeft: true,
                        ),
                        Column(
                          children: [
                            ComponentTextDescription(
                              _surahDetail?.data.nama ?? "",
                              fontSize: Size.sizeTextHeaderGlobal,
                              fontWeight: FontWeight.bold,
                              teksColor: Colors.white,
                            ),
                            ComponentTextDescription(
                              _surahDetail?.data.arti ?? "",
                              fontSize: Size.sizeTextDescriptionGlobal,
                              fontWeight: FontWeight.w500,
                              teksColor: Colors.white,
                            ),
                          ],
                        ),
                        Card(
                          elevation: 2,
                          color: ListColor.warnaNonPrimary,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ComponentTextDescription(
                              _surahDetail?.data.namaLatin ?? "",
                              teksColor: ListColor.warnaTeksPutihGlobal,
                              fontSize: Size.sizeTextDescriptionGlobal,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Size.sizeSymetricMarginPage),
                    child: ComponentTextDescription(
                      "Qari Bacaan",
                      fontSize: Size.sizeTextDescriptionGlobal,
                      fontWeight: FontWeight.bold,
                      teksColor: ListColor.warnaTeksPutihGlobal,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: DropdownButton<QoriModel>(
                      value: selectedQori,
                      hint: const Text(
                        "Pilih Qari",
                        style: TextStyle(color: ListColor.warnaTeksPutihGlobal),
                      ),
                      items: listQori.map((qori) {
                        return DropdownMenuItem<QoriModel>(
                          value: qori,
                          child: Row(
                            children: [
                              Image.asset(
                                qori.gambarQori!,
                                width: 50,
                              ),
                              const SizedBox(width: 10),
                              ComponentTextDescription(
                                qori.nameQori!,
                                fontSize: Size.sizeTextDescriptionGlobal,
                                teksColor: ListColor.warnaTeksHitamGlobal,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (qori) {
                        setState(() {
                          selectedQori = qori;
                        });
                        // Play the selected Qori's audio
                        _playAudio(_getAudioUrlForSelectedQori(qori!.idQori!));
                      },
                      isExpanded: true,
                      underline: Container(
                        height: 2,
                        color: ListColor.warnaNonPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: ComponentTextDescription(
                      " بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْم ",
                      fontSize: Size.sizeTextHeaderGlobal,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: Size.sizeSymetricMarginPage),
                      child: ComponentTextDescription(
                        "Dengan menyebut nama Allah Yang Maha Pengasih lagi Maha Penyayang",
                        fontSize: Size.sizeTextDescriptionGlobal,
                        teksColor: ListColor.warnaTeksHitamGlobal,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  _isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _surahDetail == null
                          ? const Center(
                              child: Text('Failed to load surah detail'))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: _surahDetail!.data.ayat.length,
                                itemBuilder: (context, index) {
                                  final ayat = _surahDetail!.data.ayat[index];
                                  return widgetSurat(
                                    nomorAyat: (index + 1).toString(),
                                    arti: ayat.teksIndonesia,
                                    ayat: ayat.teksArab,
                                    latin: ayat.teksLatin,
                                    urlSuaraBacaan: ayat.audio.audio01,
                                  );
                                },
                              ),
                            ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: Size.sizeSymetricMarginPage),
                    child: ComponentTextDescription(
                      "Audio Full:",
                      fontSize: Size.sizeTextDescriptionGlobal,
                      fontWeight: FontWeight.bold,
                      teksColor: ListColor.warnaTeksPutihGlobal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget widgetSurat(
      {String? nomorAyat,
      String? arti,
      String? ayat,
      String? latin,
      String? urlSuaraBacaan}) {
    bool isPlay = false;
    late AnimationController animationControllerPlayButton;
    animationControllerPlayButton = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));

    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: ListColor.warnaNonPrimary, width: 1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: ListColor.warnaNonPrimary,
                    child: ComponentTextDescription(
                      nomorAyat!,
                      fontSize: Size.sizeTextDescriptionGlobal,
                      fontWeight: FontWeight.w600,
                      teksColor: ListColor.warnaTeksPutihGlobal,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      setState(() {
                        isPlay = !isPlay;
                      });
                      if (isPlay) {
                        await _playAudio(urlSuaraBacaan!);
                        animationControllerPlayButton.forward();
                      } else {
                        _audioPlayer.stop();
                        animationControllerPlayButton.reverse();
                      }
                    },
                    icon: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: animationControllerPlayButton,
                      size: 20,
                      color: ListColor.warnaNonPrimary,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComponentTextDescription(
                ayat!,
                fontSize: Size.sizeTextHeaderGlobal,
                fontWeight: FontWeight.bold,
                teksColor: ListColor.warnaTeksHitamGlobal,
                maxLines: 20,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComponentTextDescription(
                latin!,
                fontSize: Size.sizeTextDescriptionGlobal,
                teksColor: ListColor.warnaTeksHitamGlobal,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ComponentTextDescription(
                arti!,
                fontSize: Size.sizeTextDescriptionGlobal,
                teksColor: ListColor.warnaTeksHitamGlobal,
                maxLines: 5,
                textAlign: TextAlign.start,
              ),
            )
          ]),
        )
      ],
    );
  }

  String _getAudioUrlForSelectedQori(String qoriId) {
    switch (qoriId) {
      case "01":
        return _surahDetail?.data.audioFull.audio01 ?? '';
      case "02":
        return _surahDetail?.data.audioFull.audio02 ?? '';
      case "03":
        return _surahDetail?.data.audioFull.audio03 ?? '';
      case "04":
        return _surahDetail?.data.audioFull.audio04 ?? '';
      case "05":
        return _surahDetail?.data.audioFull.audio05 ?? '';
      default:
        return '';
    }
  }
}
