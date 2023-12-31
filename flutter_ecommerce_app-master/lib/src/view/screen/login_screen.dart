// import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/core/app_data.dart';
import 'package:e_commerce_flutter/core/main_constants.dart';
import 'package:e_commerce_flutter/core/my_local_storage.dart';
import 'package:e_commerce_flutter/src/model/login_data.dart';
import 'package:e_commerce_flutter/src/view/screen/home_screen.dart';
// import 'package:e_commerce_flutter/src/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/controller/auth_controller.dart';
import 'package:e_commerce_flutter/core/my_toast.dart';
import 'package:get/get.dart';

final AuthController controller = Get.put(AuthController());
final MyToast myToast = MyToast();
final MyLocalStorage myLocalStorage = MyLocalStorage();

class LoginScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors, use_super_parameters
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginData loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Inicio de Sesión",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 250,
                height: 250,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0XFFE6E6FA),
                ),
                child: ClipOval(
                  child: Image.asset(
                    scale: 5,
                    'assets/images/logo.png',
                    width: 250,
                    height: 250,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          loginData.email = value;
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Correo electrónico',
                        suffixIcon:
                            Icon(Icons.alternate_email), // Icono de arroba (@)
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          loginData.password = value;
                        });
                      },
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Contraseña',
                        suffixIcon: Icon(Icons
                            .lock), // Puedes cambiar 'Icons.email' con el icono que desees
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0XFFE6E6FA)),
                      ),
                      onPressed: () {
                        if (!controller.loading.value) {
                          controller.loading.value = true;

                          controller
                              .login(loginData.email, loginData.password)
                              .then((value) {
                            controller.loading.value = false;

                            for (var entry in value.entries) {
                              String key = entry.key;
                              String value = entry.value.toString();
                              myLocalStorage.setValue(key, value);
                            }

                            for (var i = 0;
                                i < AppData.bottomNavyBarItems.length;
                                i++) {
                              if (AppData.bottomNavyBarItems[i].title !=
                                  MainConstants.login) {
                                AppData.bottomNavyBarItems[i].visible = true;
                              }else{
                                 AppData.bottomNavyBarItems[i].visible = false;
                              }
                            }

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()),
                            );
                          }).catchError((e) {
                            controller.loading.value = false;
                            myToast.showToastError(context, e.toString());
                          });
                        }
                      },
                      child: const Text('Iniciar Sesión'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
