import 'package:app/models/drink.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Verificando criação de drink através de um Map', () {
    Map<String, dynamic> drinkMap = <String, dynamic>{
      "idDrink": "11007",
      "strDrink": "Margarita",
      "strCategory": "Ordinary Drink",
      "strIBA": "Contemporary Classics",
      "strAlcoholic": "Alcoholic",
      "strGlass": "Cocktail glass",
      "strInstructions":
          "Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.",
      "strDrinkThumb":
          "https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg",
      "strIngredient1": "Tequila",
      "strIngredient2": "Triple sec",
      "strIngredient3": "Lime juice",
      "strIngredient4": "Salt",
      "strIngredient5": "Gin",
      "strIngredient6": 'Light rum',
      "strIngredient7": "Applejack",
      "strIngredient8": "Dark rum",
      "strIngredient9": "Sweet Vermouth",
      "strIngredient10": "Strawberry schnapps",
      "strIngredient11": "Scotch",
      "strIngredient12": "Apricot brandy",
      "strIngredient13": "Triple sec",
      "strIngredient14": "Southern Comfort",
      "strIngredient15": "Brandy",
      "strMeasure1": "1 oz ",
      "strMeasure2": "1 oz ",
      "strMeasure3": "1 oz ",
      "strMeasure4": "1 oz ",
      "strMeasure5": "1 oz ",
      "strMeasure6": "1 oz ",
      "strMeasure7": "1 oz ",
      "strMeasure8": "1 oz ",
      "strMeasure9": "1 oz ",
      "strMeasure10": "1 oz ",
      "strMeasure11": "1 oz ",
      "strMeasure12": "1 oz ",
      "strMeasure13": "1 oz ",
      "strMeasure14": "1 oz ",
      "strMeasure15": "1 oz ",
    };

    Drink drink = Drink.fromDrinkDetailMap(drinkMap);
    expect(drink.id, 11007);
    expect(drink.name, 'Margarita');
    expect(drink.category, 'Ordinary Drink');
    expect(drink.alcoholic, 'Alcoholic');
    expect(drink.glass, 'Cocktail glass');
    expect(drink.instruction,
        'Rub the rim of the glass with the lime slice to make the salt stick to it. Take care to moisten only the outer rim and sprinkle the salt on it. The salt should present to the lips of the imbiber and never mix into the cocktail. Shake the other ingredients with ice, then carefully pour into the glass.');
    expect(drink.thumb,
        'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg');
    expect(drink.thumbPreview,
        'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg/preview');

    expect(drink.ingredientList[0].name, 'Tequila');
    expect(drink.ingredientList[0].measure, '1 oz ');
    expect(drink.ingredientList[0].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[0].name}-Medium.png');

    expect(drink.ingredientList[1].name, 'Triple sec');
    expect(drink.ingredientList[1].measure, '1 oz ');
    expect(drink.ingredientList[1].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[1].name}-Medium.png');

    expect(drink.ingredientList[2].name, 'Lime juice');
    expect(drink.ingredientList[2].measure, '1 oz ');
    expect(drink.ingredientList[2].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[2].name}-Medium.png');

    expect(drink.ingredientList[3].name, 'Salt');
    expect(drink.ingredientList[3].measure, '1 oz ');
    expect(drink.ingredientList[3].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[3].name}-Medium.png');

    expect(drink.ingredientList[4].name, 'Gin');
    expect(drink.ingredientList[4].measure, '1 oz ');
    expect(drink.ingredientList[4].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[4].name}-Medium.png');

    expect(drink.ingredientList[5].name, 'Light rum');
    expect(drink.ingredientList[5].measure, '1 oz ');
    expect(drink.ingredientList[5].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[5].name}-Medium.png');

    expect(drink.ingredientList[6].name, 'Applejack');
    expect(drink.ingredientList[6].measure, '1 oz ');
    expect(drink.ingredientList[6].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[6].name}-Medium.png');

    expect(drink.ingredientList[7].name, 'Dark rum');
    expect(drink.ingredientList[7].measure, '1 oz ');
    expect(drink.ingredientList[7].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[7].name}-Medium.png');

    expect(drink.ingredientList[8].name, 'Sweet Vermouth');
    expect(drink.ingredientList[8].measure, '1 oz ');
    expect(drink.ingredientList[8].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[8].name}-Medium.png');

    expect(drink.ingredientList[9].name, 'Strawberry schnapps');
    expect(drink.ingredientList[9].measure, '1 oz ');
    expect(drink.ingredientList[9].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[9].name}-Medium.png');

    expect(drink.ingredientList[10].name, 'Scotch');
    expect(drink.ingredientList[10].measure, '1 oz ');
    expect(drink.ingredientList[10].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[10].name}-Medium.png');

    expect(drink.ingredientList[11].name, 'Apricot brandy');
    expect(drink.ingredientList[11].measure, '1 oz ');
    expect(drink.ingredientList[11].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[11].name}-Medium.png');

    expect(drink.ingredientList[12].name, 'Triple sec');
    expect(drink.ingredientList[12].measure, '1 oz ');
    expect(drink.ingredientList[12].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[12].name}-Medium.png');

    expect(drink.ingredientList[13].name, 'Southern Comfort');
    expect(drink.ingredientList[13].measure, '1 oz ');
    expect(drink.ingredientList[13].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[13].name}-Medium.png');

    expect(drink.ingredientList[14].name, 'Brandy');
    expect(drink.ingredientList[14].measure, '1 oz ');
    expect(drink.ingredientList[14].thumb,
        'https://www.thecocktaildb.com/images/ingredients/${drink.ingredientList[14].name}-Medium.png');
  });
}
