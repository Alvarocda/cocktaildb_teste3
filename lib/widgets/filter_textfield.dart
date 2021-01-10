import 'package:flutter/material.dart';

///
///
///
class FilterTextField extends StatelessWidget {
  final Function(String value) onChanged;
  final Key key;

  ///
  ///
  ///
  const FilterTextField({this.onChanged, this.key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      key: key,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Buscar',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
