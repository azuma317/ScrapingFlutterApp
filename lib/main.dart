import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/readme_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
              fontSize: 24.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
          bodyText2: TextStyle(fontSize: 16.0),
        ),
      ),
      home: ReadmePage(),
    );
  }
}
