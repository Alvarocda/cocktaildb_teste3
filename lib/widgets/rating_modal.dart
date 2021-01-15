import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

///
///
///
class RatingModal {
  ///
  ///
  ///
  static Future<double> show({
    @required BuildContext context,
    String title = 'Avaliar drink',
    String affirmative = 'Confirmar',
    String negative = 'Cancelar',
    bool marked = false,
  }) {
    Widget aff;
    Widget neg;
    double rating = 0;
    aff = FlatButton(
      onPressed: () {
        print(rating);
        Navigator.of(context).pop(rating);
      },
      child: Text(affirmative),
    );

    neg = RaisedButton(
      onPressed: () => Navigator.of(context).pop(7.0),
      child: Text(
        negative,
      ),
      color: Theme.of(context).accentColor,
    );

    return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => AlertDialog(
            title: Text(title),
            content: Container(
              height: 50,
              child: RatingBar(
                onRatingChanged: (double selectedRating) =>
                    rating = selectedRating,
                filledIcon: Icons.star,
                emptyIcon: Icons.star_border,
                filledColor: Colors.amber,
              ),
            ),
            actions: <Widget>[neg, aff],
          ),
        ) ??
        false;
  }
}
