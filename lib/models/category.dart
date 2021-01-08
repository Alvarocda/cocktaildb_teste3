import 'package:app/models/entity_base.dart';

///
///
///
class Category extends EntityBase {
  ///
  ///
  ///
  Category({String name}) : super(name: name);

  ///
  ///
  ///
  Category.fromMap(Map<String, dynamic> map) {
    name = map['strCategory'];
  }
}
