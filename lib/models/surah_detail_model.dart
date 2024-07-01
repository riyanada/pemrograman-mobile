class SurahDetailModel {
  int code;
  String message;
  SurahData data;

  SurahDetailModel({
    required this.code,
    required this.message,
    required this.data,
  });

  factory SurahDetailModel.fromJson(Map<String, dynamic> json) {
    return SurahDetailModel(
      code: json['code'],
      message: json['message'],
      data: SurahData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class SurahData {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  AudioFull audioFull;
  List<Ayat> ayat;

  SurahData({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audioFull,
    required this.ayat,
  });

  factory SurahData.fromJson(Map<String, dynamic> json) {
    var list = json['ayat'] as List;
    List<Ayat> ayatList = list.map((i) => Ayat.fromJson(i)).toList();

    return SurahData(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['namaLatin'],
      jumlahAyat: json['jumlahAyat'],
      tempatTurun: json['tempatTurun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audioFull: AudioFull.fromJson(json['audioFull']),
      ayat: ayatList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> ayatList = ayat.map((i) => i.toJson()).toList();

    return {
      'nomor': nomor,
      'nama': nama,
      'namaLatin': namaLatin,
      'jumlahAyat': jumlahAyat,
      'tempatTurun': tempatTurun,
      'arti': arti,
      'deskripsi': deskripsi,
      'audioFull': audioFull.toJson(),
      'ayat': ayatList,
    };
  }
}

class AudioFull {
  String audio01;
  String audio02;
  String audio03;
  String audio04;
  String audio05;

  AudioFull({
    required this.audio01,
    required this.audio02,
    required this.audio03,
    required this.audio04,
    required this.audio05,
  });

  factory AudioFull.fromJson(Map<String, dynamic> json) {
    return AudioFull(
      audio01: json['01'],
      audio02: json['02'],
      audio03: json['03'],
      audio04: json['04'],
      audio05: json['05'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01': audio01,
      '02': audio02,
      '03': audio03,
      '04': audio04,
      '05': audio05,
    };
  }
}

class Ayat {
  int nomorAyat;
  String teksArab;
  String teksLatin;
  String teksIndonesia;
  AyatAudio audio;

  Ayat({
    required this.nomorAyat,
    required this.teksArab,
    required this.teksLatin,
    required this.teksIndonesia,
    required this.audio,
  });

  factory Ayat.fromJson(Map<String, dynamic> json) {
    return Ayat(
      nomorAyat: json['nomorAyat'],
      teksArab: json['teksArab'],
      teksLatin: json['teksLatin'],
      teksIndonesia: json['teksIndonesia'],
      audio: AyatAudio.fromJson(json['audio']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nomorAyat': nomorAyat,
      'teksArab': teksArab,
      'teksLatin': teksLatin,
      'teksIndonesia': teksIndonesia,
      'audio': audio.toJson(),
    };
  }
}

class AyatAudio {
  String audio01;
  String audio02;
  String audio03;
  String audio04;
  String audio05;

  AyatAudio({
    required this.audio01,
    required this.audio02,
    required this.audio03,
    required this.audio04,
    required this.audio05,
  });

  factory AyatAudio.fromJson(Map<String, dynamic> json) {
    return AyatAudio(
      audio01: json['01'],
      audio02: json['02'],
      audio03: json['03'],
      audio04: json['04'],
      audio05: json['05'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '01': audio01,
      '02': audio02,
      '03': audio03,
      '04': audio04,
      '05': audio05,
    };
  }
}
