import 'package:app/models/drink.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
          leading: CachedNetworkImage(
            imageUrl: drink.thumbPreview,
            placeholder: (BuildContext context, String url) =>
                CircularProgressIndicator(),
            imageBuilder: (BuildContext context, ImageProvider imageProvider) =>
                CircleAvatar(
              backgroundImage: imageProvider,
              radius: 25,
            ),
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
