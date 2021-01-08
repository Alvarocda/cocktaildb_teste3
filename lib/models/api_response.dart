import 'dart:convert';

///
///
///
class ApiResponse {
  int statusCode;
  String rawResponse;

  ///
  ///
  ///
  ApiResponse({this.statusCode, this.rawResponse});

  ///
  ///
  ///
  Map<String, dynamic> get jsonObject {
    return json.decode(rawResponse) as Map<String, dynamic>;
  }

  ///
  ///
  ///
  List<dynamic> get jsonList {
    return json.decode(rawResponse) as List<dynamic>;
  }
}
