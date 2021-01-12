import 'package:app/screens/main_screen.dart';
import 'package:app/utils/api_resource.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/testing.dart';
import 'package:http/http.dart';

void main({ConnectionUtils connectionUtils}) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

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
