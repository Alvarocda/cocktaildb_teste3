import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

///
///
///
class RatingModal {
  ///
  ///
  ///
  static Future<bool> show({
    @required BuildContext context,
    String title = 'Avaliar drink',
    String affirmative = 'Confirmar',
    String negative = 'Cancelar',
    bool marked = false,
  }) {
    Widget aff;
    Widget neg;

    aff = FlatButton(
      onPressed: () => Navigator.of(context).pop(true),
      child: Text(affirmative),
    );

    neg = RaisedButton(
      onPressed: () => Navigator.of(context).pop(false),
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
                onRatingChanged: (_) {},
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
