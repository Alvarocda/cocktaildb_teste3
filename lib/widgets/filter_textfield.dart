import 'package:flutter/material.dart';

///
///
///
class FilterTextField extends StatelessWidget {
  final Function(String value) onChanged;

  ///
  ///
  ///
  const FilterTextField({this.onChanged, Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Buscar',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
