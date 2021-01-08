import 'package:app/models/entity_base.dart';

///
///
///
class Glass extends EntityBase {
  ///
  ///
  ///
  Glass({String name}) : super(name: name);

  ///
  ///
  ///
  Glass.fromMap(Map<String, dynamic> map) {
    name = map['strGlass'];
  }
}
