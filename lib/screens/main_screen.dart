import 'package:app/screens/drink_type_list_screen.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Cocktail DB'),
          ),
          body: Container(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: OptionTile(
                          title: 'Alcoólicos',
                          backgroundImage: AssetImage('images/alcoholic.jpg'),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OptionTile(
                          title: 'Não-alcoólicas',
                          backgroundImage:
                              AssetImage('images/non-alcoholic.jpg'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<DrinkTypeListScreen>(
                                  builder: (BuildContext context) =>
                                      DrinkTypeListScreen(DrinkType.category)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: OptionTile(
                    title: 'Categorias',
                    backgroundImage: AssetImage('images/categories.jpg'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: OptionTile(
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
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: OptionTile(
                          title: 'Ingredientes',
                          backgroundImage: AssetImage('images/ingredients.png'),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<DrinkTypeListScreen>(
                                  builder: (BuildContext context) =>
                                      DrinkTypeListScreen(
                                          DrinkType.ingredient)),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
