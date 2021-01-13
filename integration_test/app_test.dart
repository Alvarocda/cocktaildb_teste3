import 'package:app/abstract/abstract_connection.dart';
import 'package:app/main.dart';
import 'package:app/models/api_response.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/utils/api_resource.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

// class MockConnectionUtils extends Mock implements ConnectionUtils {
//   http.Client client;
//   MockConnectionUtils(this.client);
// }

///
///
///
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  ConnectionUtils connectionUtils;

  setUp(() {
    final mockito = MockClient((http.Request request) {
      http.Response response;
      if (request.url.toString().contains('list.php?c=list')) {
        response = http.Response(ApiResource.categoriesJson, 200);
      } else if (request.url.toString().contains('list.php?g=list')) {
        response = http.Response(ApiResource.glassesJson, 200);
      } else if (request.url.toString().contains('list.php?i=list')) {
        response = http.Response(ApiResource.ingredientsJson, 200);
      } else {
        response = http.Response(ApiResource.alcoholJson, 200);
      }
      return Future.value(response);
    });
    connectionUtils = ConnectionUtils(client: mockito);
  });

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

    await tester.enterText(find.byKey(Key('search-field')), 'optional');
    await tester.pumpAndSettle();
    expect(find.text('Optional alcohol'), findsOneWidget);
    expect(find.text('Alcoholic'), findsNothing);
    expect(find.text('Non alcoholic'), findsNothing);

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
    await tester.enterText(find.byKey(Key('search-field')), 'ordinary');
    await tester.pumpAndSettle();
    expect(find.text('Ordinary Drink'), findsOneWidget);
    expect(find.text('Cocktail'), findsNothing);
    expect(find.text('Milk / Float / Shake'), findsNothing);
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
    await tester.enterText(find.byKey(Key('search-field')), 'fashioned');
    await tester.pumpAndSettle();
    expect(find.text('Old-fashioned glass'), findsOneWidget);
    expect(find.text('Highball glass'), findsNothing);
    expect(find.text('Cocktail glass'), findsNothing);
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
    await tester.enterText(find.byKey(Key('search-field')), 'gin');
    await tester.pumpAndSettle();
    expect(find.text('Gin'), findsOneWidget);
    expect(find.text('Applejack'), findsNothing);
    expect(find.text('Light rum'), findsNothing);
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
