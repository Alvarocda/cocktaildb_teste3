import 'dart:async';

import 'package:app/models/drink.dart';
import 'package:app/widgets/drink_detail_info.dart';
import 'package:app/widgets/image_viewer.dart';
import 'package:app/widgets/loading.dart';
import 'package:app/widgets/rating_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

enum DrinkDetailStatus { viewing, sendingRate }

///
///
///
class DrinkDetail extends StatefulWidget {
  final Drink drink;

  ///
  ///
  ///
  const DrinkDetail({this.drink, Key key}) : super(key: key);

  ///
  ///
  ///
  @override
  _DrinkDetailState createState() => _DrinkDetailState();
}

///
///
///
class _DrinkDetailState extends State<DrinkDetail> {
  final StreamController<DrinkDetailStatus> _drinkDetailStatus =
      StreamController<DrinkDetailStatus>();

  ///
  ///
  ///
  @override
  void initState() {
    _drinkDetailStatus.add(DrinkDetailStatus.viewing);
    super.initState();
  }

  ///
  ///
  ///
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DrinkDetailStatus>(
        stream: _drinkDetailStatus.stream,
        builder:
            (BuildContext context, AsyncSnapshot<DrinkDetailStatus> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            switch (snapshot.data) {

              ///
              ///
              ///
              case DrinkDetailStatus.viewing:
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: widget.drink.thumb,
                        progressIndicatorBuilder: (BuildContext context,
                            String url, DownloadProgress progress) {
                          return Center(child: CircularProgressIndicator());
                        },
                        imageBuilder: (BuildContext context,
                            ImageProvider imageProvider) {
                          return GestureDetector(
                            onTap: () async {
                              await ImageViewer.visualizeImage(
                                  context: context, provider: imageProvider);
                            },
                            child: Center(
                              child: CircleAvatar(
                                backgroundImage: imageProvider,
                                radius: 100,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Text(
                          widget.drink.name,
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      SizedBox(height: 10),
                      DrinkDetailInfo(
                          label: 'Categoria: ', value: widget.drink.category),
                      DrinkDetailInfo(
                          label: 'Classificação: ',
                          value: widget.drink.alcoholic),
                      DrinkDetailInfo(
                          label: 'Tipo de copo: ', value: widget.drink.glass),
                      ElevatedButton(
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Compartilhar'),
                            SizedBox(width: 10),
                            Icon(Icons.share),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          double userRating =
                              await RatingModal.show(context: context);
                          if (userRating > 0 && userRating < 6) {
                            _drinkDetailStatus
                                .add(DrinkDetailStatus.sendingRate);
                            await Future.delayed(Duration(seconds: 5));
                            _drinkDetailStatus.add(DrinkDetailStatus.viewing);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Avaliação enviada com sucesso'),
                              ),
                            );
                          } else if (userRating == 0) {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Selecione pelo menos 1 ponto de classificação para avaliar',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            );
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Avaliar'),
                            SizedBox(width: 10),
                            Icon(Icons.star),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

              ///
              ///
              ///
              case DrinkDetailStatus.sendingRate:
                return Loading(message: 'Enviando avaliação');
                break;
            }
          }
          return Container();
        });
  }

  ///
  ///
  ///
  @override
  void dispose() {
    _drinkDetailStatus.close();
    super.dispose();
  }
}
