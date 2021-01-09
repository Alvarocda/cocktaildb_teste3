import 'package:app/models/entity_base.dart';

///
///
///
class Alcohol extends EntityBase {
  ///
  ///
  ///
  Alcohol({String name}) : super(name: name);

  ///
  ///
  ///
  Alcohol.fromMap(Map<String, dynamic> map) {
    name = map['strAlcoholic'];
  }
}
