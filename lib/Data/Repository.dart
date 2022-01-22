// ignore_for_file: file_names

import 'package:books/Logic/Abstractions/AbstractionBook.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AbstractionBook)
@injectable
class Repository implements AbstractionBook {}
