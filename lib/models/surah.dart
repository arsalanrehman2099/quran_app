class Surah{
  int? id;
  String? name;
  String? transliteration;
  String? type;
  int? total_verses;
  List? verses;

  Surah(
      {this.id,
      this.name,
      this.transliteration,
      this.type,
      this.total_verses,
      this.verses});

  Surah fromMap(Map surah) {
    return Surah(
      id: surah['id'],
      name: surah['name'],
      transliteration: surah['transliteration'],
      type: surah['type'],
      total_verses: surah['total_verses'],
      verses: surah['verses'],
    );
  }
}