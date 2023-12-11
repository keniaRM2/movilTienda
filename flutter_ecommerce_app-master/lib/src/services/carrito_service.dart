import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class CarritoService extends MainService {

  Future<dynamic> obtenerMiCarrito() async {
    http.Response response = await getRequest(APIConstants.carritoMiCarrito);
    return json.decode(response.body);
  }

  Future<dynamic> agregarProductoCarrito(Map<String, dynamic> parameters) async {
    http.Response response = await putRequest(APIConstants.carritoRegistrar, parameters);
    return json.decode(response.body);
  }
  
}
