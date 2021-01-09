import 'package:flutter/material.dart';

///
///
///
class BorderedText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color textColor;
  final Color borderColor;
  final double borderWidth;
  final TextAlign textAlign;

  ///
  ///
  ///
  const BorderedText(
      {this.textColor = Colors.white,
      this.textAlign,
      this.fontSize,
      this.borderWidth = 5,
      this.borderColor = Colors.black,
      this.title,
      Key key})
      : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(
              fontSize: fontSize,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = borderWidth
                ..color = borderColor),
        ),
        Text(
          title,
          textAlign: textAlign,
          style: TextStyle(color: textColor, fontSize: fontSize),
        )
      ],
    );
  }
}
