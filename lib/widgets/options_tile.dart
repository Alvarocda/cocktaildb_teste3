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
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.fill,
        ),
      ),
      child: FlatButton(
          onPressed: onPressed,
          child: BorderedText(
            title: title,
            fontSize: 28,
            textAlign: TextAlign.center,
            borderWidth: 7,
          )),
    );
  }
}
