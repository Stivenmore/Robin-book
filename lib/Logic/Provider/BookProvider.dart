// ignore_for_file: file_names

import 'dart:async';

import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:books/Logic/Models/Standart/ModelBook.dart';
import 'package:books/Logic/Models/Standart/ModelSearch.dart';
import 'package:books/UI/Utils/Implement/deboucer.dart';
import 'package:books_finder/books_finder.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BookProvider with ChangeNotifier {
  final AbstractionBook abstractionBook;
  List<ModelSubjectsLover> modelsubjectlover = [];
  List<ModelSubjectsAction> modelsubjectaction = [];
  List<ModelSearch> modelsearch = [];
  String errorGlobal = '';

  BookProvider(this.abstractionBook) {
    worksLover();
    worksRecomendation();
  }
  final StreamController<List<ModelSearch>> _suggestionStreamContoller =
      StreamController.broadcast();
  Stream<List<ModelSearch>> get suggestionStream =>
      _suggestionStreamContoller.stream;

  void clearErrorGlobal() {
    errorGlobal = '';
    notifyListeners();
  }

  Future initializate() async {
    await worksLover();
    await worksRecomendation();
  }

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  Future worksLover() async {
    final resp = await abstractionBook.getbookSubjects(subjects: 'love.json');
    if (resp["status"] == 200) {
      modelsubjectlover = (resp["data"]["works"] as Iterable)
          .map((e) => ModelSubjectsLover.fromJson(e))
          .toList();
      notifyListeners();
    } else {
      switch (resp["status"]) {
        case 400:
          errorGlobal = 'No es posible realizar la accion';
          notifyListeners();
          break;
        case 404:
          errorGlobal =
              "No es posible conectar con el servidor, comprueba tu conexion a internet";
          notifyListeners();
          break;
        case 500:
          errorGlobal =
              "No es posible realizar esta accion, por favor intente mas tarde";
          notifyListeners();
          break;
        case 503:
          errorGlobal = "Servicio no disponible";
          notifyListeners();
          break;
        default:
          errorGlobal = "Error";
          notifyListeners();
          break;
      }
    }
  }

  Future worksRecomendation() async {
    final resp = await abstractionBook.getbookSubjects(subjects: 'action.json');
    if (resp["status"] == 200) {
      modelsubjectaction = (resp["data"]["works"] as Iterable)
          .map((e) => ModelSubjectsAction.fromJson(e))
          .toList();
      notifyListeners();
    } else {
      switch (resp["status"]) {
        case 400:
          errorGlobal = 'No es posible realizar la accion';
          notifyListeners();
          break;
        case 404:
          errorGlobal =
              "No es posible conectar con el servidor, comprueba tu conexion a internet";
          notifyListeners();
          break;
        case 500:
          errorGlobal =
              "No es posible realizar esta accion, por favor intente mas tarde";
          notifyListeners();
          break;
        case 503:
          errorGlobal = "Servicio no disponible";
          notifyListeners();
          break;
        default:
          errorGlobal = "Error";
          notifyListeners();
          break;
      }
    }
  }

  Future getSearchForApiGoogle({required String q}) async {
    final List<Book> books = await queryBooks(
      q,
      maxResults: 3,
      printType: PrintType.books,
      orderBy: OrderBy.relevance,
    );
    if (books[1].info.imageLinks.isNotEmpty &&
        books[1].info.description != '') {
      return {
        "MapImage": books[1].info.imageLinks.values.first.toString(),
        "Description": books[1].info.description
      };
    } else {
      return {
        "MapImage": books[2].info.imageLinks.values.first.toString(),
        "Description": books[2].info.description
      };
    }
  }

  Future getSearchWorks({required String q}) async {
    try {
      final resp = await abstractionBook.getSearch(q: q);
      if (resp["status"] == 200) {
        modelsearch = (resp["data"]["docs"] as Iterable)
            .map((e) => ModelSearch.fromJson(e))
            .toList();
        notifyListeners();
        return modelsearch;
      } else {
        switch (resp["status"]) {
          case 400:
            errorGlobal = 'No es posible realizar la accion';
            notifyListeners();
            break;
          case 404:
            errorGlobal =
                "No es posible conectar con el servidor, comprueba tu conexion a internet";
            notifyListeners();
            break;
          case 500:
            errorGlobal =
                "No es posible realizar esta accion, por favor intente mas tarde";
            notifyListeners();
            break;
          case 503:
            errorGlobal = "Servicio no disponible";
            notifyListeners();
            break;
          default:
            errorGlobal = "Error";
            notifyListeners();
            break;
        }
        return null;
      }
    } catch (e) {}
  }

  void getStreamSearch(String searT) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await getSearchWorks(q: value);
      _suggestionStreamContoller.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = searT;
    });

    Future.delayed(const Duration(milliseconds: 301))
        .then((_) => timer.cancel());
  }

  @override
  void dispose() {
    _suggestionStreamContoller.close();
    super.dispose();
  }
}
