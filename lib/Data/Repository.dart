// ignore_for_file: file_names

import 'dart:convert';

import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:books/UI/Utils/Global/Env.dart';
import 'package:books_finder/books_finder.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: AbstractionBook)
@injectable
class Repository implements AbstractionBook {
  @override
  Future getbookSubjects({required subjects}) async {
    try {
      final response = await http.get(Uri.parse('$url/subjects/$subjects'));
      return {
        "data": json.decode(response.body),
        "status": response.statusCode
      };
    } catch (e) {
      if (kDebugMode) {
        print('getBook catch: ' + e.toString());
      }
      return {"data": null, "status": 500};
    }
  }

  @override
  Future getSearch({required q}) async {
    try {
      final response = await http.get(Uri.parse('$url/search.json?q=$q'));
      return {
        "data": json.decode(response.body),
        "status": response.statusCode
      };
    } catch (e) {
      if (kDebugMode) {
        print('getBook catch: ' + e.toString());
      }
      return {"data": null, "status": 500};
    }
  }
}
