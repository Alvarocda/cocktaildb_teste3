///
///
///
class Drink {
  int id;
  String name;
  String thumb;
  String thumbPreview;

  ///
  ///
  ///
  Drink({this.name, this.id, this.thumb, this.thumbPreview});

  ///
  ///
  ///
  Drink.fromMap(Map<String, dynamic> map) {
    id = int.parse(map['idDrink'] as String);
    name = map['strDrink'];
    thumb = map['strDrinkThumb'];
    thumbPreview = '$thumb/preview';
  }
}
