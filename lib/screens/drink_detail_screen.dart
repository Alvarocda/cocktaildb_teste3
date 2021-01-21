import 'package:app/abstract/abstract_connection.dart';
import 'package:app/models/api_response.dart';
import 'package:app/models/drink.dart';
import 'package:app/widgets/drink_detail.dart';
import 'package:app/widgets/ingredient_list.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkDetailScreen extends StatefulWidget {
  final Drink drink;
  final AbstractConnection connectionUtils;

  ///
  ///
  ///
  const DrinkDetailScreen({this.drink, this.connectionUtils, Key key})
      : super(key: key);

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
  ///
  ///
  ///
  Future<Drink> _getDrinkDetail() async {
    ApiResponse apiResponse;
    try {
      apiResponse =
          await widget.connectionUtils.get('lookup.php?i=${widget.drink.id}');
      if (apiResponse.statusCode == 200) {
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
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Detalhes do drink'),
            bottom: TabBar(
              tabs: <Tab>[
                Tab(
                  text: 'Detalhes',
                ),
                Tab(
                  text: 'Preparo',
                ),
                Tab(
                  text: 'Ingredientes',
                ),
              ],
            ),
          ),
          body: FutureBuilder<Drink>(
            future: _getDrinkDetail(),
            builder: (BuildContext context, AsyncSnapshot<Drink> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  Drink drink = snapshot.data;
                  return TabBarView(children: [
                    SingleChildScrollView(
                      child: DrinkDetail(drink: drink),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        drink.instruction,
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    IngredientList(ingredientList: drink.ingredientList),
                  ]);
                }
              }
              return Loading(message: 'Carregando detalhes do drink');
            },
          ),
        ),
      ),
    );
  }
}
