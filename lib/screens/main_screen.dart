import 'package:app/models/config.dart';
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
  Config _config;

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
        body: Column(
          children: [
            Text(
              'Olá usuário, escolha uma opção abaixo para filtrar os drinks',
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),
            ),
            Expanded(
              child: GridView.count(
                padding: EdgeInsets.all(5),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: <Widget>[
                  OptionTile(
                    title: 'Classificação',
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
                    title: 'Categoria',
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
                    title: 'Copo',
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
                    title: 'Ingrediente',
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
          ],
        ),
      ),
    );
  }

  ///
  ///
  ///
  @override
  void initState() {
    super.initState();
  }
}
