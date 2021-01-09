import 'package:app/models/alcohol.dart';
import 'package:flutter_test/flutter_test.dart';

///
///
///
void main() {
  test('Verificando criação de alcohol através de um Map', () {
    Map<String, dynamic> alcoholMap = <String, dynamic>{
      'strAlcoholic': 'Alcoholic'
    };

    Alcohol alcohol = Alcohol.fromMap(alcoholMap);
    expect(alcohol.name, 'Alcoholic');
  });
}
