class ModelSearch {
  final String? key;
  final String? title;
  final int? editioncount;
  final int? firtspublicyear;
  final int? numberofpagemediam;
  final List? contributor;
  final List? author;
  final List? time;

  ModelSearch(
      {required this.key,
      required this.title,
      required this.editioncount,
      required this.firtspublicyear,
      required this.numberofpagemediam,
      required this.contributor,
      required this.author,
      required this.time});

  factory ModelSearch.fromJson(Map<String, dynamic> map) {
    return ModelSearch(
        key: map["key"] as String? ?? '',
        title: map["title"] as String? ?? 'No disponible',
        editioncount: map["edition_count"] as int? ?? 1,
        firtspublicyear: map["first_publish_year"] as int? ?? 1,
        numberofpagemediam: map["number_of_pages_median"] as int? ?? 1,
        contributor: map["contributor"] as List? ?? ["No disponible"],
        author: map["author_name"] as List? ?? ["No disponible"],
        time: map["time"] as List? ?? ["No disponible"]);
  }
}
