import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/my_toast.dart';
import 'package:e_commerce_flutter/src/controller/auth_controller.dart';
import 'package:e_commerce_flutter/src/model/contacto_dto.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final AuthController authController = Get.put(AuthController());
final MyToast myToast = MyToast();

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _secondEmail = TextEditingController(text: '');
  final TextEditingController _telephone = TextEditingController(text: '');
  final TextEditingController _secondTelephone =
      TextEditingController(text: '');
  ContactoDTO contactoDTO = ContactoDTO();

  @override
  void initState() {
    super.initState();

    _updateScreen();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _updateScreen();
  }

  void _updateScreen() {
    authController.loading.value = true;

    // if (!authController.loading.value) {
    authController.loading.value = true;

    authController.obtenerUsuarioSecion().then((value) {
      authController.loading.value = false;

      contactoDTO = ContactoDTO.fromJson(value);

      _secondEmail.text = contactoDTO.correoElectronico ?? '';
      _telephone.text = contactoDTO.telefonoPrincipal ?? '';
      _secondTelephone.text = contactoDTO.telefonoSecundario ?? '';
    }).catchError((e) {
      authController.loading.value = false;
      myToast.showToastError(context, e.toString());
    });
    // }
    if (mounted) {
      setState(() {});
    }
  }

  void save(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      // if (!authController.loading.value) {
      authController.loading.value = true;

      contactoDTO.correoElectronico = _secondEmail.text;
      contactoDTO.telefonoPrincipal = _telephone.text;
      contactoDTO.telefonoSecundario = _secondTelephone.text;

      authController.actualizarContacto(contactoDTO).then((value) {
        authController.loading.value = false;
        myToast.showToastSuccess(context, 'Información guardada correctamente');
        Navigator.pop(context);
      }).catchError((e) {
        authController.loading.value = false;
        myToast.showToastError(context, e.toString());
      });
      // }
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                const Text('Datos de Contacto', style: TextStyle(fontSize: 16)),
            backgroundColor: AppColor.lightPurple),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: const EdgeInsets.all(16),
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 8,
                child: Form(
                  key: _formKey,
                  onChanged: () {
                    setState(() {});
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Segundo Correo:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _secondEmail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Celular:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _telephone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Segundo Celular:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                          controller: _secondTelephone,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor: AppColor.lightPurple),
                            onPressed: () {
                              save(context);
                            },
                            child: const Text('Guardar')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
