import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main_service.dart';
import '../../core/api_constants.dart';

class AuthService extends MainService {

  Future<dynamic> login(Map<String, dynamic> parameters) async {
    http.Response response = await postRequest(APIConstants.login, parameters);
    return json.decode(response.body);
  }
  Future<dynamic> obtenerUsuarioSecion(Map<String, dynamic> parameters) async {
    http.Response response = await postRequest(APIConstants.usuarioObtener, parameters);
    return json.decode(response.body);
  }
  
}
