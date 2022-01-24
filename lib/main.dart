// ignore_for_file: use_key_in_widget_constructors

import 'package:books/Logic/Dependency/injection.dart';
import 'package:books/Logic/Models/Hive/HiveBook.dart';
import 'package:books/Logic/Provider/BookProvider.dart';
import 'package:books/UI/Components/Splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async {
  //Ambiente de la aplicacion
  configureInjection();
  //Inicializacion de Widget, Preferencias y Box(Hive)
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await path.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(HiveBookAdapter());
  await Hive.openBox<HiveBook>('HiveBook');
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

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Robin Books',
        debugShowCheckedModeBanner: false,
        home: Splash());
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}
