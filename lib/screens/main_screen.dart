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
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Alcolicos'))),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Não Alcolicos')),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: ElevatedButton(
                    child: Text('Categorias'),
                    onPressed: () {},
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {}, child: Text('Glasses'))),
                      SizedBox(width: 5),
                      Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: Text('Ingredientes')),
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
