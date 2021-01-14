import 'package:app/abstract/abstract_connection.dart';
import 'package:app/models/config.dart';
import 'package:app/screens/drink_type_list_screen.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';

///
///
///
class MainScreen extends StatefulWidget {
  final AbstractConnection connection;

  ///
  ///
  ///
  const MainScreen({this.connection, Key key}) : super(key: key);

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
  AbstractConnection connection;

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
                    key: Key('Classificação'),
                    title: 'Classificação',
                    backgroundImage: AssetImage('images/alcoholic.jpg'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<DrinkTypeListScreen>(
                          builder: (BuildContext context) =>
                              DrinkTypeListScreen(
                            DrinkType.alcohol,
                            connectionUtils: connection,
                          ),
                        ),
                      );
                    },
                  ),
                  OptionTile(
                    key: Key('Categoria'),
                    title: 'Categoria',
                    backgroundImage: AssetImage('images/categories.jpg'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<DrinkTypeListScreen>(
                          builder: (BuildContext context) =>
                              DrinkTypeListScreen(
                            DrinkType.category,
                            connectionUtils: connection,
                          ),
                        ),
                      );
                    },
                  ),
                  OptionTile(
                    key: Key('Copo'),
                    title: 'Copo',
                    backgroundImage: AssetImage('images/glasses.jpg'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<DrinkTypeListScreen>(
                          builder: (BuildContext context) =>
                              DrinkTypeListScreen(DrinkType.glass,
                                  connectionUtils: connection),
                        ),
                      );
                    },
                  ),
                  OptionTile(
                    key: Key('Ingrediente'),
                    title: 'Ingrediente',
                    backgroundImage: AssetImage('images/ingredients.png'),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<DrinkTypeListScreen>(
                          builder: (BuildContext context) =>
                              DrinkTypeListScreen(DrinkType.ingredient,
                                  connectionUtils: connection),
                        ),
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
    if (widget.connection == null) {
      connection = ConnectionUtils();
    } else {
      connection = widget.connection;
    }
    super.initState();
  }
}
