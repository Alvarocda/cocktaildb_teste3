import 'dart:async';

import 'package:app/models/alcohol.dart';
import 'package:app/models/api_response.dart';
import 'package:app/models/category.dart';
import 'package:app/models/entity_base.dart';
import 'package:app/models/glass.dart';
import 'package:app/models/ingredient.dart';
import 'package:app/screens/drinks_list_screen.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/filter_textfield.dart';
import 'package:app/widgets/loading.dart';
import 'package:flutter/material.dart';

///
///
///
enum DrinkType { alcohol, category, glass, ingredient }

///
///
///
class DrinkTypeListScreen extends StatefulWidget {
  final DrinkType drinkType;

  ///
  ///
  ///
  const DrinkTypeListScreen(this.drinkType, {Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkTypeListScreenState createState() => _DrinkTypeListScreenState();
}

///
///
///
class _DrinkTypeListScreenState extends State<DrinkTypeListScreen> {
  List<EntityBase> _drinkTypeList;
  final StreamController<List<EntityBase>> _filteredResults =
      StreamController<List<EntityBase>>();

  ///
  ///
  ///
  Future<List<EntityBase>> _getDrinksTypes() async {
    ConnectionUtils connectionUtils = ConnectionUtils();
    ApiResponse apiResponse;
    try {
      switch (widget.drinkType) {
        case DrinkType.category:
          apiResponse = await connectionUtils.get('list.php?c=list');
          break;
        case DrinkType.glass:
          apiResponse = await connectionUtils.get('list.php?g=list');
          break;
        case DrinkType.ingredient:
          apiResponse = await connectionUtils.get('list.php?i=list');
          break;
        case DrinkType.alcohol:
          apiResponse = await connectionUtils.get('list.php?a=list');
          break;
      }
    } catch (err) {
      print(err.toString());
    }

    if (apiResponse != null && apiResponse.statusCode == 200) {
      List<EntityBase> drinkTypeList = List<EntityBase>();
      for (dynamic option in apiResponse.jsonObject['drinks']) {
        switch (widget.drinkType) {
          case DrinkType.alcohol:
            drinkTypeList.add(Alcohol.fromMap(option));
            break;
          case DrinkType.category:
            drinkTypeList.add(Category.fromMap(option));
            break;
          case DrinkType.glass:
            drinkTypeList.add(Glass.fromMap(option));
            break;
          case DrinkType.ingredient:
            drinkTypeList.add(Ingredient.fromMap(option));
            break;
        }
      }
      _drinkTypeList = drinkTypeList;
      _filteredResults.add(drinkTypeList);
      return drinkTypeList;
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
          title: Text('Tipos de drinks'),
        ),
        body: FutureBuilder<List<EntityBase>>(
          future: _getDrinksTypes(),
          builder:
              (BuildContext context, AsyncSnapshot<List<EntityBase>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    FilterTextField(
                      onChanged: (String value) {
                        if (value != null && value.isNotEmpty) {
                          _filteredResults.add(_drinkTypeList
                              .where((EntityBase element) =>
                                  element.name.toLowerCase().contains(value))
                              .toList());
                        } else {
                          _filteredResults.add(_drinkTypeList);
                        }
                      },
                    ),
                    Expanded(
                      child: StreamBuilder<List<EntityBase>>(
                        stream: _filteredResults.stream,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<EntityBase>> filteredSnapshot) {
                          if (filteredSnapshot.hasData) {
                            return ListView.builder(
                              itemCount: filteredSnapshot.data.length,
                              itemBuilder:
                                  (BuildContext filterContext, int index) {
                                EntityBase option =
                                    filteredSnapshot.data[index];
                                return ListTile(
                                    title: Text(option.name),
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              DrinkListScreen(
                                            drinkType: widget.drinkType,
                                            typeName: option.name,
                                          ),
                                        ),
                                      );
                                    });
                              },
                            );
                          }
                          return Container();
                        },
                      ),
                    )
                  ],
                );
                return StreamBuilder(builder: null);
                // return ListView.builder(
                //   itemCount: snapshot.data.length,
                //   itemBuilder: (BuildContext context, int index) {
                //     EntityBase option = snapshot.data[index];
                //     return ListTile(
                //       title: Text(option.name),
                //       onTap: () {
                //         Navigator.of(context).push(
                //           MaterialPageRoute(
                //             builder: (BuildContext context) => DrinkListScreen(
                //               drinkType: widget.drinkType,
                //               typeName: option.name,
                //             ),
                //           ),
                //         );
                //       },
                //     );
                //   },
                // );
              }
            }
            return Loading(
              width: 100,
              height: 100,
              message: 'Aguarde, carregando',
            );
          },
        ),
      ),
    );
  }
}
