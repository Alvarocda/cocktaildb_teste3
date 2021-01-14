import 'package:app/abstract/abstract_connection.dart';
import 'package:app/models/api_response.dart';
import 'package:http/http.dart' as http;

///
///
///
class ConnectionUtils implements AbstractConnection {
  static String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';
  http.Client client;

  ConnectionUtils({this.client}) {
    if (client == null) {
      client = http.Client();
    }
  }

  ///
  ///
  ///
  Future<ApiResponse> get(String endpoint) async {
    String url = '$_baseUrl$endpoint';
    var response = await client.get(url);
    return ApiResponse(
        rawResponse: response.body, statusCode: response.statusCode);
  }
}
