import 'package:app/models/category.dart';
import 'package:app/utils/connection_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';

///
///
///
void main() {
  test('Verificando criação de categoria através de um Map', () {
    Map<String, dynamic> categoryMap = <String, dynamic>{
      'strCategory': 'Ordinary Drink'
    };

    Category category = Category.fromMap(categoryMap);
    expect(category.name, 'Ordinary Drink');
  });
}
