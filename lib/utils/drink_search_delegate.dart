import 'package:app/models/drink.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkSearchDelegate extends SearchDelegate<Drink> {
  final List<Drink> drinkList;
  DrinkSearchDelegate({this.drinkList}) : super(searchFieldLabel: 'Buscar');

  ///
  ///
  ///
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  ///
  ///
  ///
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  ///
  ///
  ///
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  ///
  ///
  ///
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Drink> filteredDrinkList = drinkList
        .where((Drink element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredDrinkList.length,
      itemBuilder: (BuildContext context, int index) {
        Drink drink = filteredDrinkList[index];
        return ListTile(
          title: Text(drink.name),
          onTap: () {
            close(context, drink);
          },
        );
      },
    );
  }
}
