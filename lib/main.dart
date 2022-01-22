// ignore_for_file: use_key_in_widget_constructors

import 'package:books/Logic/Dependency/injection.dart';
import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:books/UI/Components/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  //Ambiente de la aplicacion
  configureInjection();
  //Inicializacion de Widget, Preferencias y Box(Hive)
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Injector());
}

class Injector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => getIt<BookProvider>())],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Books', debugShowCheckedModeBanner: false, home:  Splash());
  }
}
