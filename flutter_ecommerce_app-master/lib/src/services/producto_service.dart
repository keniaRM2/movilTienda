import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class ProductoService extends MainService {

  Future<List<dynamic>> listarProductos() async {
    http.Response response = await getRequest(APIConstants.productoListar);
    return json.decode(response.body);
  }
  
  Future<dynamic> obtenerProducto(Map<String, dynamic> parameters) async {
    http.Response response = await postRequest(APIConstants.productoObtener, parameters);
    return json.decode(response.body);
  }

}
