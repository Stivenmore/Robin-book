import 'package:hive/hive.dart';

part 'HiveBook.g.dart';

@HiveType(typeId: 0)
class HiveBook extends HiveObject {
  HiveBook(
      {required this.author,
      required this.contributor,
      required this.description,
      required this.editioncount,
      required this.firtspublicyear,
      required this.numberofpagemediam,
      required this.time,
      required this.title,
      required this.urlImg});

  @HiveField(0)

  @HiveField(1)
  String? title;

  @HiveField(2)
  int? editioncount;

  @HiveField(3)
  String? urlImg;

  @HiveField(4)
  List? author;

  @HiveField(5)
  int? firtspublicyear;

  @HiveField(6)
  int? numberofpagemediam;

  @HiveField(7)
  List? contributor;

  @HiveField(8)
  List? time;

  @HiveField(9)
  String? description;
}

// flutter pub run build_runner build --delete-conflicting-outputs
// El comando anterior se utiliza para generar el codigo HIVE para BDLocal