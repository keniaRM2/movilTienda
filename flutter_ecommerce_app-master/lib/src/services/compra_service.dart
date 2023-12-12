import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class CompraService extends MainService {

  Future<dynamic> registrarCompra(Map<String, dynamic> parameters) async {
    http.Response response = await putRequest(APIConstants.compraRegistrar, parameters);
    return json.decode(response.body);
  }
  
}
