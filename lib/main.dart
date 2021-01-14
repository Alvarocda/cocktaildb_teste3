import 'package:app/screens/main_screen.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
///
///
void main({ConnectionUtils connectionUtils}) {
  ///
  ///
  ///
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color.fromRGBO(34, 150, 241, 1), // status bar color
  ));
}

///
///
///
class MyApp extends StatelessWidget {
  const MyApp();

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Teste prático 3 - Cocktail DB',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
