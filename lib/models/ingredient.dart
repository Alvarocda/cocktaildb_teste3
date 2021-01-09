import 'package:app/models/entity_base.dart';

///
///
///
class Ingredient extends EntityBase {
  String measure;
  String thumb;

  ///
  ///
  ///
  Ingredient({String name}) : super(name: name);

  ///
  ///
  ///
  Ingredient.fromMap(Map<String, dynamic> map) {
    name = map['strIngredient1'];
  }

  Ingredient.fromDrink(Map<String, dynamic> map, int index) {
    name = map['strIngredient$index}'];
    measure = map['strMeasure$index}'];
  }
}
