import 'package:app/models/api_response.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:flutter/material.dart';

///
///
///
enum DrinkType { alcohol, category, glass, ingredient }

///
///
///
class DrinkTypeListScreen extends StatefulWidget {
  final DrinkType drinkType;

  ///
  ///
  ///
  const DrinkTypeListScreen(this.drinkType, {Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkTypeListScreenState createState() => _DrinkTypeListScreenState();
}

///
///
///
class _DrinkTypeListScreenState extends State<DrinkTypeListScreen> {
  ///
  ///
  ///
  Future<List<Map<String, dynamic>>> _getDrinksTypes() async {
    ConnectionUtils connectionUtils = ConnectionUtils();
    ApiResponse apiResponse;
    switch (widget.drinkType) {
      case DrinkType.category:
        apiResponse = await connectionUtils.get('list.php?c=list');
        break;
      case DrinkType.glass:
        apiResponse = await connectionUtils.get('list.php?g=list');
        break;
      case DrinkType.ingredient:
        apiResponse = await connectionUtils.get('list.php?i=list');
        break;
    }
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
