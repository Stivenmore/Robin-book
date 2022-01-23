// ignore_for_file: file_names

import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:books/UI/Utils/Global/Env.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: AbstractionBook)
@injectable
class Repository implements AbstractionBook {
  @override
  Future getbookSubjects({required subjects}) async {
    try {
      final request = await http.get(Uri.parse('$url/subjects/$subjects'));
      return request;
    } catch (e) {
      if (kDebugMode) {
        print('getBook catch: ' + e.toString());
      }
    }
  }
}
