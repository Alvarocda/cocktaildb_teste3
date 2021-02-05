import 'package:app/models/entity_base.dart';
import 'package:app/models/ingredient.dart';

///
///
///
class Drink extends EntityBase {
  int id;
  String thumb;
  String thumbPreview;
  String category;
  String alcoholic;
  String glass;
  String instruction;
  List<Ingredient> ingredientList;

  ///
  ///
  ///
  Drink(
      {String name,
      this.id,
      this.thumb,
      this.thumbPreview,
      this.alcoholic,
      this.category,
      this.glass,
      this.ingredientList,
      this.instruction})
      : super(name: name);

  ///
  ///
  ///
  Drink.fromMap(Map<String, dynamic> map) {
    id = int.parse(map['idDrink'] as String);
    name = map['strDrink'];
    thumb = map['strDrinkThumb'];
    thumbPreview = '$thumb/preview';
  }

  ///
  ///
  ///
  Drink.fromDrinkDetailMap(Map<String, dynamic> map) {
    id = int.parse(map['idDrink'] as String);
    name = map['strDrink'];
    thumb = map['strDrinkThumb'];
    thumbPreview = '$thumb/preview';
    category = map['strCategory'];
    alcoholic = map['strAlcoholic'];
    glass = map['strGlass'];
    instruction = map['strInstructions'];
    ingredientList = List<Ingredient>();
    for (int index = 1; index <= 15; index++) {
      Ingredient ingredient = Ingredient();
      ingredient.name = map['strIngredient$index'];
      if (ingredient.name == null || ingredient.name.isEmpty) {
        continue;
      }
      ingredient.measure = map['strMeasure$index'];
      ingredient.thumb =
          'https://www.thecocktaildb.com/images/ingredients/${ingredient.name}-Medium.png';
      ingredientList.add(ingredient);
    }
  }
}
