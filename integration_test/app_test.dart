import 'dart:math';

import 'package:app/abstract/abstract_connection.dart';
import 'package:app/main.dart';
import 'package:app/models/api_response.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/utils/api_resource.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/loading.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:integration_test/integration_test.dart';

///
///
///
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  ConnectionUtils connectionUtils;

  setUp(
    () {
      final mockito = MockClient(
        (http.Request request) {
          http.Response response;
          if (request.url.toString().contains('list.php?c=list')) {
            response = http.Response(ApiResource.categoriesJson, 200);
          } else if (request.url.toString().contains('list.php?g=list')) {
            response = http.Response(ApiResource.glassesJson, 200);
          } else if (request.url.toString().contains('list.php?i=list')) {
            response = http.Response(ApiResource.ingredientsJson, 200);
          } else if (request.url.toString().contains('list.php?a=list')) {
            response = http.Response(ApiResource.alcoholJson, 200);
          } else if (request.url
              .toString()
              .contains('filter.php?a=Alcoholic')) {
            response = http.Response(ApiResource.alcoholicDrinks, 200);
          } else if (request.url.toString().contains('lookup.php?i=14029')) {
            response = http.Response(ApiResource.drinkDetail, 200);
          }
          return Future.value(response);
        },
      );
      connectionUtils = ConnectionUtils(client: mockito);
    },
  );

  ///
  ///
  ///
  testWidgets("Deve mostrar os 4 botões da tela principal",
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pumpAndSettle();
    expect(find.byType(OptionTile), findsNWidgets(4));
  });

  ///
  ///
  ///
  testWidgets(
      'Deve abrir a lista de classificação de drinks ao clicar no botão de classificação na tela principal'
      'Deve filtrar a lista procurando pelo termo "Optional", verificar se apenas'
      '1 registro apareceu e então, voltar para a tela principal',
      (WidgetTester tester) async {
    await _createWidget(tester, connectionUtils);
    await tester.tap(find.byKey(Key('Classificação')));
    await tester.pumpAndSettle();
    print('Teste rodando');
    expect(find.text('Alcoholic'), findsOneWidget);
    expect(find.text('Non alcoholic'), findsOneWidget);
    expect(find.text('Optional alcohol'), findsOneWidget);
    await tester.tap(find.byKey(Key('search-button')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'optional');
    await tester.pumpAndSettle();
    expect(find.text('Optional alcohol'), findsOneWidget);
    expect(find.text('Alcoholic'), findsNothing);
    expect(find.text('Non alcoholic'), findsNothing);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Cocktail DB'), findsOneWidget);
  });

  ///
  ///
  ///
  testWidgets(
      'Deve abrir a lista das bebidas filtradas por categoria,'
      'Verificar se os 3 primeiros itens da lista correspondem com o teste,'
      'Filtrar a lista procurando pela palavra "ordinary" e verificar'
      'se existe apenas 1 item na lista apos filtrar'
      'e então, deve clicar no botão de voltar e'
      'verificar se o app parou na tela principal',
      (WidgetTester tester) async {
    await _createWidget(tester, connectionUtils);
    await tester.tap(find.byKey(Key('Categoria')));
    await tester.pumpAndSettle();
    expect(find.text('Ordinary Drink'), findsOneWidget);
    expect(find.text('Cocktail'), findsOneWidget);
    expect(find.text('Milk / Float / Shake'), findsOneWidget);
    await tester.tap(find.byKey(Key('search-button')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'ordinary');
    await tester.pumpAndSettle();
    expect(find.text('Ordinary Drink'), findsOneWidget);
    expect(find.text('Cocktail'), findsNothing);
    expect(find.text('Milk / Float / Shake'), findsNothing);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Cocktail DB'), findsOneWidget);
  });

  ///
  ///
  ///
  testWidgets(
      'Deve abrir a lista das bebidas filtradas por copo,'
      'Verificar se os 3 primeiros itens da lista correspondem com o teste,'
      'Filtrar a lista procurando pela palavra "fashioned" e verificar'
      'se existe apenas 1 item na lista apos filtrar'
      'e então, deve clicar no botão de voltar e'
      'verificar se o app parou na tela principal',
      (WidgetTester tester) async {
    await _createWidget(tester, connectionUtils);
    await tester.tap(find.byKey(Key('Copo')));
    await tester.pumpAndSettle();
    expect(find.text('Highball glass'), findsOneWidget);
    expect(find.text('Cocktail glass'), findsOneWidget);
    expect(find.text('Old-fashioned glass'), findsOneWidget);
    await tester.tap(find.byKey(Key('search-button')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'fashioned');
    await tester.pumpAndSettle();
    expect(find.text('Old-fashioned glass'), findsOneWidget);
    expect(find.text('Highball glass'), findsNothing);
    expect(find.text('Cocktail glass'), findsNothing);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Cocktail DB'), findsOneWidget);
  });

  ///
  ///
  ///
  testWidgets(
      'Deve abrir a lista das bebidas filtradas por ingrediente,'
      'Verificar se os 3 primeiros itens da lista correspondem com o teste,'
      'Filtrar a lista procurando pela palavra "Applejack" e verificar'
      'se existe apenas 1 item na lista apos filtrar'
      'e então, deve clicar no botão de voltar e'
      'verificar se o app parou na tela principal',
      (WidgetTester tester) async {
    await _createWidget(tester, connectionUtils);
    await tester.tap(find.byKey(Key('Ingrediente')));
    await tester.pumpAndSettle();
    expect(find.text('Light rum'), findsOneWidget);
    expect(find.text('Applejack'), findsOneWidget);
    expect(find.text('Gin'), findsOneWidget);
    await tester.tap(find.byKey(Key('search-button')));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'gin');
    await tester.pumpAndSettle();
    expect(find.text('Gin'), findsOneWidget);
    expect(find.text('Applejack'), findsNothing);
    expect(find.text('Light rum'), findsNothing);
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Cocktail DB'), findsOneWidget);
  });

  ///
  ///
  ///
  testWidgets(
      'Clica no botão de classificação na tela principal'
      'Seleciona a opção Alcohol'
      'Verifica se 3 drinks vão aparecer na tela'
      'Seleciona o drink chamado \'57 Chevy with a White License Plate'
      'Abre a tela de detalhes do drink'
      'Navega para a tela de instrução de preparo'
      'Verifica se as instruções estão aparecendo corretamente,'
      'Navega para a tela de ingredientes e verifica se 3 ingredientes vão aparecer'
      'Volta para a lista de bebidas '
      'Volta para a tela principal do app', (WidgetTester tester) async {
    await _createWidget(tester, connectionUtils);
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(Key('Classificação')));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Alcoholic'));
    await tester.pumpAndSettle();
    expect(find.text('\'57 Chevy with a White License Plate'), findsOneWidget);
    expect(find.text('1-900-FUK-MEUP'), findsOneWidget);
    expect(find.text('110 in the shade'), findsOneWidget);
    await tester.tap(find.text('\'57 Chevy with a White License Plate'));
    await tester.pumpAndSettle();
    expect(find.byType(Tab), findsNWidgets(3));
    expect(find.text('Detalhes'), findsOneWidget);
    expect(find.text('Preparo'), findsOneWidget);
    expect(find.text('Ingredientes'), findsOneWidget);
    expect(find.text('\'57 Chevy with a White License Plate'), findsOneWidget);
    expect(find.text('Cocktail'), findsOneWidget);
    expect(find.text('Alcoholic'), findsOneWidget);
    expect(find.text('Highball glass'), findsOneWidget);
    expect(find.byIcon(Icons.share), findsOneWidget);
    expect(find.byIcon(Icons.star), findsOneWidget);
    await tester.tap(find.text('Preparo'));
    await tester.pumpAndSettle();
    expect(
        find.text(
            '1. Fill a rocks glass with ice 2.add white creme de cacao and vodka 3.stir'),
        findsOneWidget);
    await tester.tap(find.text('Ingredientes'));
    await tester.pumpAndSettle();
    expect(find.text('Creme de Cacao'), findsOneWidget);
    expect(find.text('Vodka'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Drinks'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Tipos de drinks'), findsOneWidget);
    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();
    expect(find.text('Cocktail DB'), findsOneWidget);
  });
}

///
///
///
Future<void> _createWidget(
    WidgetTester tester, ConnectionUtils connectionUtils) async {
  await tester.pumpWidget(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(
        connection: connectionUtils,
      ),
    ),
  );
  await tester.pump();
}
