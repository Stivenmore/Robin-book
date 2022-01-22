import 'package:books/Logic/Dependency/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

GetIt getIt = GetIt.instance;
@injectableInit
void configureInjection() => $initGetIt();
