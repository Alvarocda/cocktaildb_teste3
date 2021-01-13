import 'dart:async';

import 'package:app/abstract/abstract_connection.dart';
import 'package:app/models/api_response.dart';
import 'package:app/models/drink.dart';
import 'package:app/screens/drink_detail_screen.dart';
import 'package:app/screens/drink_type_list_screen.dart';
import 'package:app/widgets/drink_list_tile.dart';
import 'package:app/widgets/filter_textfield.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';

///
///
///
class DrinkListScreen extends StatefulWidget {
  final DrinkType drinkType;
  final String typeName;
  final AbstractConnection connectionUtils;

  ///
  ///
  ///
  const DrinkListScreen(
      {this.drinkType, this.typeName, this.connectionUtils, Key key})
      : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkListScreenState createState() => _DrinkListScreenState();
}

///
///
///
class _DrinkListScreenState extends State<DrinkListScreen> {
  List<Drink> _drinkList;
  final StreamController<List<Drink>> _filteredDrinkListStream =
      StreamController<List<Drink>>();

  ///
  ///
  ///
  Future<List<Drink>> _getDrinksList() async {
    ApiResponse apiResponse;
    switch (widget.drinkType) {
      case DrinkType.alcohol:
        apiResponse =
            await widget.connectionUtils.get('filter.php?a=${widget.typeName}');
        break;
      case DrinkType.category:
        apiResponse =
            await widget.connectionUtils.get('filter.php?c=${widget.typeName}');
        break;
      case DrinkType.glass:
        apiResponse =
            await widget.connectionUtils.get('filter.php?g=${widget.typeName}');
        break;
      case DrinkType.ingredient:
        apiResponse =
            await widget.connectionUtils.get('filter.php?i=${widget.typeName}');
        break;
    }
    if (apiResponse != null && apiResponse.statusCode == 200) {
      _drinkList = List<Drink>();
      for (dynamic drinkData in apiResponse.jsonObject['drinks']) {
        _drinkList.add(Drink.fromMap(drinkData));
      }
      _filteredDrinkListStream.add(_drinkList);
      return _drinkList;
    }
    return null;
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drinks'),
        ),
        body: FutureBuilder<List<Drink>>(
          future: _getDrinksList(),
          builder: (BuildContext context, AsyncSnapshot<List<Drink>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    FilterTextField(
                      onChanged: (String value) {
                        if (value != null && value.isNotEmpty) {
                          _filteredDrinkListStream.add(_drinkList
                              .where((Drink element) =>
                                  element.name.toLowerCase().contains(value))
                              .toList());
                        } else {
                          _filteredDrinkListStream.add(_drinkList);
                        }
                      },
                    ),
                    Expanded(
                      child: StreamBuilder<List<Drink>>(
                        stream: _filteredDrinkListStream.stream,
                        builder: (BuildContext streamContext,
                            AsyncSnapshot<List<Drink>> streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            if (streamSnapshot.data.isEmpty) {
                              return Center(
                                  child: Text(
                                      'Nenhum drink encontrado com o termo informado =('));
                            }
                            return ListView.builder(
                              itemCount: streamSnapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                Drink drink = streamSnapshot.data[index];
                                return DrinkListTile(
                                  drink: drink,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DrinkDetailScreen(
                                          connectionUtils:
                                              widget.connectionUtils,
                                          drink: drink,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ],
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Por favor, verifique sua conexão com a internet e tente novamente',
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            }
            return Loading(
              message: 'Carregando Drinks',
            );
          },
        ),
      ),
    );
  }
}
