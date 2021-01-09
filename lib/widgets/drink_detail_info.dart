import 'package:flutter/material.dart';

///
///
///
class DrinkDetailInfo extends StatelessWidget {
  final String label;
  final String value;

  ///
  ///
  ///
  const DrinkDetailInfo({this.value, this.label, Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          label,
          style: _drinkDetailLabelTextStyle(),
        ),
        Text(value, style: _drinkDetailTextStyle()),
      ],
    );
  }

  ///
  ///
  ///
  TextStyle _drinkDetailTextStyle() {
    return TextStyle(fontSize: 18);
  }

  ///
  ///
  ///
  TextStyle _drinkDetailLabelTextStyle() {
    return TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
  }
}
