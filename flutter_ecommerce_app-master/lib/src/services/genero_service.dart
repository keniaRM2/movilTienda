import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class GeneroService extends MainService {

  Future<List<dynamic>> listar() async {
    http.Response response = await getRequest(APIConstants.generoListar);
    return json.decode(response.body);
  }
  
}
