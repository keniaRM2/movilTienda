import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/core/my_local_storage.dart';
import 'package:e_commerce_flutter/src/services/login_service.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class EmailController extends GetxController {
  RxBool loading = false.obs;

  final LoginService emailService = LoginService();
  final MyLocalStorage myLocalStorage = MyLocalStorage();

  Future<String> getEmail() async {
    return myLocalStorage.getValue(MainConstants.email);
  }
  
}
