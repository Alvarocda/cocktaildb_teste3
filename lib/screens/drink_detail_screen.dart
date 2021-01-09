import 'package:app/models/api_response.dart';
import 'package:app/models/drink.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/drink_detail.dart';
import 'package:app/widgets/ingredient_list.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkDetailScreen extends StatefulWidget {
  final Drink drink;

  ///
  ///
  ///
  const DrinkDetailScreen({this.drink, Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkDetailScreenState createState() => _DrinkDetailScreenState();
}

///
///
///
class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  Future<Drink> _getDrinkDetail() async {
    ConnectionUtils connectionUtils = ConnectionUtils();
    ApiResponse apiResponse;
    try {
      apiResponse =
          await connectionUtils.get('lookup.php?i=${widget.drink.id}');
      if (apiResponse.statusCode == 200) {
        print(apiResponse.jsonObject['drinks']);
        return Drink.fromDrinkDetailMap(apiResponse.jsonObject['drinks'][0]);
      }
      throw Exception();
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Detalhes do drink'),
        ),
        body: FutureBuilder<Drink>(
          future: _getDrinkDetail(),
          builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                Drink drink = snapshot.data;
                return Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      DrinkDetail(
                        drink: drink,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      IngredientList(
                        ingredientList: drink.ingredientList,
                      ),
                    ],
                  ),
                );
              }
            }
            return Loading(message: 'Carregando detalhes do drink');
          },
        ),
      ),
    );
  }
}
