import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class StockService extends MainService {

  Future<List<dynamic>> listar() async {
    http.Response response = await getRequest(APIConstants.stockListar);
    return json.decode(response.body);
  }
  
  // Future<dynamic> obtenerProducto(Map<String, dynamic> parameters) async {
  //   http.Response response = await postRequest(APIConstants.productoObtener, parameters);
  //   return json.decode(response.body);
  // }

}
