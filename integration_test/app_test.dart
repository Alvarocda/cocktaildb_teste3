import 'package:app/main.dart';
import 'package:app/screens/main_screen.dart';
import 'package:app/widgets/filter_textfield.dart';
import 'package:app/widgets/options_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

///
///
///
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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
    await tester.pumpWidget(MyApp());
    await tester.tap(find.byKey(Key('Classificação')));
    await tester.pumpAndSettle(Duration(seconds: 6));

    expect(find.text('Alcoholic'), findsOneWidget);
    expect(find.text('Non alcoholic'), findsOneWidget);
    expect(find.text('Optional alcohol'), findsOneWidget);
    expect(find.text('Classificação'), findsNothing);

    await tester.enterText(find.byKey(Key('search-field')), 'optional');
    await tester.pumpAndSettle(Duration(milliseconds: 500));
    expect(find.text('Optional alcohol'), findsOneWidget);
    expect(find.text('Alcoholic'), findsNothing);
    expect(find.text('Non alcoholic'), findsNothing);

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('Cocktail DB'), findsOneWidget);
  });
}
