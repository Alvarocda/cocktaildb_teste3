import 'package:app/models/api_response.dart';

///
///
///
abstract class AbstractConnection {
  ///
  ///
  ///
  Future<ApiResponse> get(String endpoint);
}
