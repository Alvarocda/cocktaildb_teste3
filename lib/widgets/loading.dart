import 'package:flutter/material.dart';

///
///
///
class Loading extends StatelessWidget {
  final double height;
  final double width;
  final String message;

  ///
  ///
  ///
  const Loading({this.height = 100, this.message, this.width = 100, Key key})
      : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              child: CircularProgressIndicator(),
              height: height,
              width: width,
            ),
            SizedBox(
              height: 10,
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
