import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../core/main_constants.dart';
import '../../core/my_local_storage.dart';

final MyLocalStorage myLocalStorage = MyLocalStorage();

class MainService {
  Future<http.Response> _handleRequest(
      Future<http.Response> Function() requestMethod) async {
    final response = await requestMethod();

    if (response.statusCode != MainConstants.exito) {
      dynamic badRequest = json.decode(response.body);
      if (badRequest != null && badRequest.containsKey('mensaje')) {
        throw Exception(badRequest['mensaje']);
      } else {
        throw Exception(
            '${MainConstants.mensajeErrorGeneral} (${response.statusCode})');
      }
    }

    return response;
  }

  Future<http.Response> postRequest(String path, dynamic data) async {
    String token = await myLocalStorage.getValue(MainConstants.token);
    Map<String, String> config = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await _handleRequest(() async {
      return await http.post(
        Uri.parse(path),
        headers: config,
        body: json.encode(data),
      );
    });
  }

  Future<http.Response> getRequest(String path) async {
    String token = await myLocalStorage.getValue(MainConstants.token);
    Map<String, String> config = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await _handleRequest(() async {
      return await http.get(
        Uri.parse(path),
        headers: config,
      );
    });
  }

  Future<http.Response> putRequest(String path, dynamic data) async {
    String token = await myLocalStorage.getValue(MainConstants.token);
    Map<String, String> config = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await _handleRequest(() async {
      return await http.put(
        Uri.parse(path),
        headers: config,
        body: json.encode(data),
      );
    });
  }

  Future<http.Response> deleteRequest(String path, dynamic data) async {
    String token = await myLocalStorage.getValue(MainConstants.token);
    Map<String, String> config = {
      'Authorization': token,
      'Content-Type': 'application/json',
    };

    return await _handleRequest(() async {
      return await http.delete(
        Uri.parse(path),
        headers: config,
        body: json.encode(data),
      );
    });
  }
}
