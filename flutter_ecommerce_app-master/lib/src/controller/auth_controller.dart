import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/core/my_local_storage.dart';
import 'package:e_commerce_flutter/src/model/contacto_dto.dart';
import 'package:e_commerce_flutter/src/model/direccion_dto.dart';
import 'package:e_commerce_flutter/src/model/persona_dto.dart';
import 'package:e_commerce_flutter/src/services/auth_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AuthController extends GetxController {
  RxBool loading = false.obs;

  final AuthService authService = AuthService();
  final MyLocalStorage myLocalStorage = MyLocalStorage();

  Future<dynamic> login(String usuario, String contrasena) async {
    Map<String, dynamic> parameters = {
      'usuario': usuario,
      'contrasena': contrasena
    };
    return await authService.login(parameters);
  }

  Future<dynamic> actualizarPersona( PersonaDTO personaDTO) async {
    return await authService.actualizarPersona(personaDTO.toJson());
  }
   Future<dynamic> actualizarDireccion( DireccionDTO direccionDTO ) async {
    return await authService.actualizarDireccion(direccionDTO.toJson());
  }
   Future<dynamic> actualizarContacto( ContactoDTO contactoDTO) async {
    return await authService.actualizarContacto(contactoDTO.toJson());
  }

  Future<dynamic> obtenerUsuarioSecion() async {
    Map<String, dynamic> parameters = {};
    return await authService.obtenerUsuarioSecion(parameters);
  }

  Future<String> getFullNameUser() async {
    return myLocalStorage.getValue(MainConstants.nombreCompleto);
  }
  Future<String> getfechaNacimiento() async {
    return myLocalStorage.getValue(MainConstants.fechaNacimiento);
  }

  Future<bool> isAuthenticated() async {
    String token = await myLocalStorage.getValue(MainConstants.token);
    return token.isNotEmpty;
  }
}
