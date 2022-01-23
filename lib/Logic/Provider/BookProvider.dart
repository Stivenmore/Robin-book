// ignore_for_file: file_names

import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  final AbstractionBook abstractionBook;

  BookProvider(this.abstractionBook) {
    worksLover();
  }

  Future worksLover() async {
    final res = await abstractionBook.getbookSubjects(subjects: 'love.json');
  }

  Future worksRecomendation() async {
    final res = await abstractionBook.getbookSubjects(subjects: '');
  }
}
