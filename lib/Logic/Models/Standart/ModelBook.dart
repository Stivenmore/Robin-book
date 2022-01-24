class ModelSubjectsLover {
  final String? key;
  final String? title;
  final int? editioncount;
  final List<Authors>? authors;
  final String? img;

  ModelSubjectsLover(
      {required this.key,
      required this.title,
      required this.editioncount,
      required this.authors,
      required this.img});

  factory ModelSubjectsLover.fromJson(Map<String, dynamic> map) {
    final listauthor = List.from(map['authors'] ?? []);

    return ModelSubjectsLover(
        key: map['key'] as String? ?? '',
        title: map['title'] as String? ?? 'No disponible',
        editioncount: map['edition_count'] as int? ?? 1,
        img: "assets/amor.jpg",
        authors: listauthor.isNotEmpty
            ? listauthor.map((e) => Authors.fromJson(e)).toList()
            : []);
  }
}

class ModelSubjectsAction {
  final String? key;
  final String? title;
  final int? editioncount;
  final List<Authors>? authors;
  final String? img;

  ModelSubjectsAction(
      {required this.key,
      required this.title,
      required this.editioncount,
      required this.authors,
      required this.img});

  factory ModelSubjectsAction.fromJson(Map<String, dynamic> map) {
    final listauthor = List.from(map['authors'] ?? []);

    return ModelSubjectsAction(
        key: map['key'] as String? ?? '',
        title: map['title'] as String? ?? 'No disponible',
        editioncount: map['edition_count'] as int? ?? 1,
        img: "assets/accion.jpeg",
        authors: listauthor.isNotEmpty
            ? listauthor.map((e) => Authors.fromJson(e)).toList()
            : []);
  }
}

class Authors {
  final String? key;
  final String? name;

  Authors({required this.key, required this.name});

  factory Authors.fromJson(Map<String, dynamic> map) {
    return Authors(
        key: map["key"] as String? ?? '',
        name: map["name"] as String? ?? 'No disponible');
  }
}
