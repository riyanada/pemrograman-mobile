class Surah {
  int number;
  String name;
  String nameLatin;
  int numberOfAyahs;
  String revelationType;
  String meaning;
  String description;
  Map<String, String> audioFull;

  Surah({
    required this.number,
    required this.name,
    required this.nameLatin,
    required this.numberOfAyahs,
    required this.revelationType,
    required this.meaning,
    required this.description,
    required this.audioFull,
  });

  factory Surah.fromJson(Map<String, dynamic> json) {
    return Surah(
      number: json['nomor'],
      name: json['nama'],
      nameLatin: json['namaLatin'],
      numberOfAyahs: json['jumlahAyat'],
      revelationType: json['tempatTurun'],
      meaning: json['arti'],
      description: json['deskripsi'],
      audioFull: Map<String, String>.from(json['audioFull']),
    );
  }
}
