import 'package:app/models/glass.dart';
import 'package:flutter_test/flutter_test.dart';

///
///
///
void main() {
  test('Verificando criação de glass através de um Map', () {
    Map<String, dynamic> glassMap = <String, dynamic>{
      'strGlass': 'Old-fashioned glass'
    };

    Glass glass = Glass.fromMap(glassMap);
    expect(glass.name, 'Old-fashioned glass');
  });
}
