import 'package:app/screens/drink_type_list_screen.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';

///
///
///
class MainScreen extends StatefulWidget {
  ///
  ///
  ///
  @override
  _MainScreenState createState() => _MainScreenState();
}

///
///
///
class _MainScreenState extends State<MainScreen> {
  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cocktail DB'),
        ),
        body: GridView.count(
          padding: EdgeInsets.all(5),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            OptionTile(
              title: 'Alcoólicos',
              backgroundImage: AssetImage('images/alcoholic.jpg'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<DrinkTypeListScreen>(
                      builder: (BuildContext context) =>
                          DrinkTypeListScreen(DrinkType.alcohol)),
                );
              },
            ),
            OptionTile(
              title: 'Categorias',
              backgroundImage: AssetImage('images/categories.jpg'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<DrinkTypeListScreen>(
                      builder: (BuildContext context) =>
                          DrinkTypeListScreen(DrinkType.category)),
                );
              },
            ),
            OptionTile(
              title: 'Glasses',
              backgroundImage: AssetImage('images/glasses.jpg'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<DrinkTypeListScreen>(
                      builder: (BuildContext context) =>
                          DrinkTypeListScreen(DrinkType.glass)),
                );
              },
            ),
            OptionTile(
              title: 'Ingredientes',
              backgroundImage: AssetImage('images/ingredients.png'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<DrinkTypeListScreen>(
                      builder: (BuildContext context) =>
                          DrinkTypeListScreen(DrinkType.ingredient)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
