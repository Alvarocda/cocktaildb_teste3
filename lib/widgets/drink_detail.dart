import 'package:app/models/drink.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkDetail extends StatelessWidget {
  final Drink drink;

  ///
  ///
  ///
  const DrinkDetail({this.drink, Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(drink.thumb),
            radius: 100,
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            drink.name,
            style: TextStyle(fontSize: 26),
          ),
        ),
        Text('Categoria: ${drink.category}', style: _drinkDetailTextStyle()),
        Text('Tipo: ${drink.alcoholic}', style: _drinkDetailTextStyle()),
        Text('Glass: ${drink.glass}', style: _drinkDetailTextStyle()),
        Text('Instruções de preparo: \n ${drink.instruction}',
            style: _drinkDetailTextStyle()),
        Text(
          'Ingredientes',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  TextStyle _drinkDetailTextStyle() {
    return TextStyle(fontSize: 18);
  }
}
