import 'package:app/models/ingredient.dart';
import 'package:flutter_test/flutter_test.dart';

///
///
///
void main() {
  test('Verificando criação de ingrediente através de um Map', () {
    Map<String, dynamic> ingredientMap = <String, dynamic>{
      'strIngredient1': 'Midori melon liqueur'
    };

    Ingredient ingredient = Ingredient.fromMap(ingredientMap);
    expect(ingredient.name, 'Midori melon liqueur');
  });
}
