import 'package:e_commerce_flutter/core/app_color.dart';
import 'package:e_commerce_flutter/core/my_toast.dart';
import 'package:e_commerce_flutter/src/model/direccion_dto.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_flutter/src/controller/auth_controller.dart';
import 'package:get/get.dart';

final AuthController authController = Get.put(AuthController());
final MyToast myToast = MyToast();

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  DireccionDTO direccionDTO = DireccionDTO();

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

        direccionDTO = DireccionDTO.fromJson(value);

        _federalEntity.text = direccionDTO.entidadFederativa ?? '';
        _municipality.text = direccionDTO.municipio ?? '';
        _colony.text = direccionDTO.colonia ?? '';
        _outdoorNumber.text = direccionDTO.numeroExterior ?? '';
        _interiorNumber.text = direccionDTO.numeroInterior ?? '';
        _street.text = direccionDTO.calle ?? '';
      }).catchError((e) {

        authController.loading.value = false;
        myToast.showToastError(context, e.toString());
      });
    // }
    if (mounted) {
      setState(() {});
    }
  }

  void _saveAddress(BuildContext context) {
    if (_formKey.currentState!.validate()) {

      // if (!authController.loading.value) {
        authController.loading.value = true;

        authController.actualizarDireccion(direccionDTO).then((value) {
          authController.loading.value = false;
          myToast.showToastSuccess(context, 'Dirección guardada correctamente');
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

  final _formKey = GlobalKey<FormState>();

  // final TextEditingController _postalCode = TextEditingController(text: '');

  final TextEditingController _federalEntity = TextEditingController(text: '');
  final TextEditingController _municipality = TextEditingController(text: '');
  final TextEditingController _outdoorNumber = TextEditingController(text: '');
  final TextEditingController _interiorNumber = TextEditingController(text: '');
  final TextEditingController _colony = TextEditingController(text: '');
  final TextEditingController _street = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Dirección de Envio',
                style: TextStyle(fontSize: 16)),
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
                          decoration:
                              const InputDecoration(labelText: 'Estado:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _federalEntity,
                          onChanged: (value) {
                            setState(() {
                              direccionDTO.entidadFederativa = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              labelText: 'Municipio/Delegación:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          controller: _municipality,
                          onChanged: (value) {
                            setState(() {
                              direccionDTO.municipio = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Colonia:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          controller: _colony,
                          onChanged: (value) {
                            setState(() {
                              direccionDTO.colonia = value;
                            });
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: TextFormField(
                      //     decoration: const InputDecoration(
                      //         labelText: 'Código Postal:'),
                      //     validator: (value) {
                      //       if (value == null || value.isEmpty) {
                      //         return 'Campo obligario';
                      //       } else {
                      //         return null;
                      //       }
                      //     },
                      //     keyboardType: TextInputType.number,
                      //     controller: _postalCode,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         direccionDTO.codigo= value;
                      //       });
                      //     },
                      //   ),
                      // ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Número Exterior',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obligatorio';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: _outdoorNumber,
                                onChanged: (value) {
                                  setState(() {
                                    direccionDTO.numeroExterior = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Número Interior',
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obligatorio';
                                  } else {
                                    return null;
                                  }
                                },
                                keyboardType: TextInputType.number,
                                controller: _interiorNumber,
                                onChanged: (value) {
                                  setState(() {
                                    direccionDTO.numeroInterior = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Calle:'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obligario';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.text,
                          controller: _street,
                          onChanged: (value) {
                            setState(() {
                              direccionDTO.calle = value;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(300, 50),
                                backgroundColor: AppColor.lightPurple),
                            onPressed: () {
                              _saveAddress(context);
                              //  Navigator.push(  context,MaterialPageRoute(  builder: (context) =>LoginScreen());                                           ),
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
