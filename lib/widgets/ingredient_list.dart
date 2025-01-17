import 'package:app/models/ingredient.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

///
///
///
class IngredientList extends StatelessWidget {
  final List<Ingredient> ingredientList;

  ///
  ///
  ///
  const IngredientList({this.ingredientList, Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: ingredientList.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        Ingredient ingredient = ingredientList[index];
        return ListTile(
          leading: CachedNetworkImage(
            imageUrl: ingredient.thumb,
            placeholder: (context, url) => CircularProgressIndicator(),
          ),
          title: Text(ingredient.name),
          subtitle: Text(
              'Quantiade: ${ingredient.measure == null ? 'A gosto' : ingredient.measure}'),
        );
      },
    );
  }
}
