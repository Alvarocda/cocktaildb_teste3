import 'package:app/models/drink.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkListTile extends StatelessWidget {
  final Drink drink;
  final Function onPressed;

  ///
  ///
  ///
  const DrinkListTile({@required this.drink, @required this.onPressed, Key key})
      : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          onTap: onPressed,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(drink.thumbPreview),
            radius: 25,
          ),
          title: Text(
            drink.name,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
