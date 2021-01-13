import 'package:app/models/entity_base.dart';
import 'package:flutter/material.dart';

class EntityBaseSearchDelegate extends SearchDelegate<EntityBase> {
  final List<EntityBase> entitiesList;
  final Function(EntityBase entityBase) selectedType;
  EntityBaseSearchDelegate({this.entitiesList, this.selectedType})
      : super(searchFieldLabel: 'Buscar');

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<EntityBase> filteredList = entitiesList
        .where((EntityBase element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (BuildContext context, int index) {
        EntityBase entity = filteredList[index];
        return ListTile(
          title: Text(entity.name),
          onTap: () {
            Navigator.of(context).pop();
            selectedType(entity);
          },
        );
      },
    );
  }
}
