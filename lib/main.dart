import 'package:flutter/material.dart';
import 'Pages/home_page.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

const Color primaryColor = Color.fromRGBO(0, 11, 25,1.0);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        ),
      home: const Home(),

    );
  }
}


