import 'package:app/widgets/bordered_text.dart';
import 'package:flutter/material.dart';

///
///
///
class OptionTile extends StatelessWidget {
  final ImageProvider backgroundImage;
  final String title;
  final Function onPressed;

  ///
  ///
  ///
  const OptionTile({this.backgroundImage, this.onPressed, this.title, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black45, blurRadius: 3, spreadRadius: 1),
        ],
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.fill,
        ),
      ),
      child: FlatButton(
          onPressed: onPressed,
          child: BorderedText(
            title: title,
            fontSize: 24,
            textAlign: TextAlign.center,
            borderWidth: 5,
          )),
    );
  }
}
