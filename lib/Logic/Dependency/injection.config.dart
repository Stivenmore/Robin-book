import 'package:books/Data/Repository.dart';
import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt() {
  getIt
    ..registerFactory<Repository>(() => Repository())
    ..registerFactory<BookProvider>(
        () => BookProvider(getIt<AbstractionBook>()));
  getIt.registerFactory<AbstractionBook>(() => Repository());
}
