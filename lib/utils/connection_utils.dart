import 'package:app/models/api_response.dart';
import 'package:http/http.dart' as http;

class ConnectionUtils {
  static const String _baseUrl = 'https://www.thecocktaildb.com/api/json/v1/1/';

  Future<ApiResponse> get(String endpoint) async {
    String url = '$_baseUrl$endpoint';
    print(url);
    var response = await http.get(url);
    return ApiResponse(
        rawResponse: response.body, statusCode: response.statusCode);
  }
}
