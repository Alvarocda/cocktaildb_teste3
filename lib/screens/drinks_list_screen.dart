import 'package:app/models/api_response.dart';
import 'package:app/models/drink.dart';
import 'package:app/screens/drink_detail_screen.dart';
import 'package:app/screens/drink_type_list_screen.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/drink_list_tile.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkListScreen extends StatefulWidget {
  final DrinkType drinkType;
  final String typeName;

  ///
  ///
  ///
  const DrinkListScreen({this.drinkType, this.typeName, Key key})
      : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkListScreenState createState() => _DrinkListScreenState();
}

///
///
///
class _DrinkListScreenState extends State<DrinkListScreen> {
  Future<List<Drink>> _getDrinksList() async {
    ConnectionUtils connectionUtils = ConnectionUtils();
    ApiResponse apiResponse;
    switch (widget.drinkType) {
      case DrinkType.alcohol:
        apiResponse =
            await connectionUtils.get('filter.php?a=${widget.typeName}');
        break;
      case DrinkType.category:
        apiResponse =
            await connectionUtils.get('filter.php?c=${widget.typeName}');
        break;
      case DrinkType.glass:
        apiResponse =
            await connectionUtils.get('filter.php?g=${widget.typeName}');
        break;
      case DrinkType.ingredient:
        apiResponse =
            await connectionUtils.get('filter.php?i=${widget.typeName}');
        break;
    }
    if (apiResponse != null && apiResponse.statusCode == 200) {
      List<Drink> drinks = List<Drink>();
      for (dynamic drinkData in apiResponse.jsonObject['drinks']) {
        drinks.add(Drink.fromMap(drinkData));
      }
      return drinks;
    }
    return null;
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drinks'),
        ),
        body: FutureBuilder<List<Drink>>(
          future: _getDrinksList(),
          builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Drink drink = snapshot.data[index];
                    return DrinkListTile(
                      drink: drink,
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                DrinkDetailScreen(
                              drink: drink,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              }
            }
            return Loading(
              message: 'Carregando Drinks',
            );
          },
        ),
      ),
    );
  }
}
